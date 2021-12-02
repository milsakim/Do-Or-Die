//
//  CategoryListViewController.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import UIKit

class CategoryListViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet weak var categoryListView: UITableView!
    
    let categoryListCellID: String = "CategoryListCell"
    
    var categories: [Category] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view did load")
        populateCategoryData()
//        dfs()
        commonInit()
    }
    
    private func commonInit() {
        setupCategoryListView()
        navigationBarSetup()
    }
    
}

extension CategoryListViewController {
    
    private func populateCategoryData() {
        print("populateCategoryData")
        let c1: Category = Category(title: "c1")
        let c2: Category = Category(title: "c2")
        categories.append(c1)
        categories.append(c2)
        
        let c1_1: Category = Category(title: "c1_1")
        c1_1.level = 1
        let c1_2: Category = Category(title: "c1_2")
        c1_2.level = 1
        let c1_3: Category = Category(title: "c1_3")
        c1_3.level = 1
        let c1_4: Category = Category(title: "c1_4")
        c1_4.level = 1
        c1.subcategories.append(c1_1)
        c1.subcategories.append(c1_2)
        c1.subcategories.append(c1_3)
        c1.subcategories.append(c1_4)
        
        let c2_1: Category = Category(title: "c2_1")
        c2_1.level = 1
        let c2_2: Category = Category(title: "c2_2")
        c2_2.level = 1
        c2.subcategories.append(c2_1)
        c2.subcategories.append(c2_2)
        
        let c1_1_1: Category = Category(title: "c1_1_1")
        c1_1_1.level = 2
        let c1_1_2: Category = Category(title: "c1_1_2")
        c1_1_2.level = 2
        let c1_1_3: Category = Category(title: "c1_1_3")
        c1_1_3.level = 2
        c1_1.subcategories.append(c1_1_1)
        c1_1.subcategories.append(c1_1_2)
        c1_1.subcategories.append(c1_1_3)
    }
    
}
