//
//  CategoryListCell2.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/12/02.
//

import UIKit

class CategoryListCell2: UITableViewCell {
    
    static let id: String = "CategoryListCell2"
    
    // MARK: - Property
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subcategoryButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var indent: NSLayoutConstraint!
    
    weak var delegate: CategoryListCell2Delegate?
    
    var isExpanded: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        subcategoryButton.addAction(UIAction(handler: { [unowned self] action in
            delegate?.tapSubcategoryButton(sender: self)
        }), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(_ category: Category) {
        if category.isExpaned {
            subcategoryButton.setImage( UIImage(systemName: "arrowtriangle.down"), for: .normal)
        }
        else {
            subcategoryButton.setImage( UIImage(systemName: "arrowtriangle.right"), for: .normal)
        }
        
        if category.subcategories.isEmpty {
            subcategoryButton.isHidden = true
        }
        titleLabel.text = category.title
        
        countLabel.text = "\(category.subcategories.count)"
        
        indent.constant = CGFloat(10 * category.level)
    }
    
}

