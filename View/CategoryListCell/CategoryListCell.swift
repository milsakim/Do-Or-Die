//
//  CategoryListCell.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import UIKit

class CategoryListCell: UITableViewCell {
    
    static let id: String = "CategoryListCell"
    
    // MARK: - Property
    
    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subCategoryListView: UITableView!
    @IBOutlet weak var disclosureButton: UIButton!
    
    @IBOutlet weak var subCategoryListViewHeight: NSLayoutConstraint!
    
    var isSubcategoryListViewHidden: Bool {
        return subCategoryListView.isHidden
    }
    
    var delegate: CategoryListCellDelegate?
    
    var data: [Category] = []
    
    // MARK: - Initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("nib: \(subCategoryListView.contentSize.height)")
        subCategoryListView.isHidden = true
        subCategoryListView.dataSource = self
//        subCategoryListView.delegate = self
//        categoryListView.register(UITableViewCell.self, forCellReuseIdentifier: categoryListCellID)
        subCategoryListView.register(UINib(nibName: CategoryListCell.id, bundle: .main), forCellReuseIdentifier: CategoryListCell.id)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func collapseOrExpand(_ sender: Any) {
        if isSubcategoryListViewHidden {
            showSubcategoryListView()
        }
        else {
            hideSubcategoryListView()
        }
        
        delegate?.disclosureButtonDidTap()
    }
}

extension CategoryListCell {
    
    func showSubcategoryListView() {
        disclosureButton.setImage( UIImage(systemName: "arrowtriangle.down"), for: .normal)
        subCategoryListView.isHidden = false
    }
    
    func hideSubcategoryListView() {
        disclosureButton.setImage( UIImage(systemName: "arrowtriangle.backward.fill"), for: .normal)
        subCategoryListView.isHidden = true
    }
    
}

extension CategoryListCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection: \(subCategoryListView.contentSize.height)")
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CategoryListCell = tableView.dequeueReusableCell(withIdentifier: CategoryListCell.id, for: indexPath) as? CategoryListCell else {
            fatalError("fail to dequeue cell")
        }
        print("cellForRowAt: \(subCategoryListView.contentSize.height)")
        subCategoryListViewHeight.constant = subCategoryListView.contentSize.height
        cell.titleLabel.text = data[indexPath.row].title
        cell.data = data[indexPath.row].subcategories
        
        return cell
    }
    
}
