//
//  CategoryListSetup.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import Foundation
import UIKit

extension CategoryListViewController {
    
    func setupCategoryListView() {
        categoryListView.dataSource = self
        categoryListView.delegate = self
//        categoryListView.register(UITableViewCell.self, forCellReuseIdentifier: categoryListCellID)
//        categoryListView.register(UINib(nibName: CategoryListCell.id, bundle: .main), forCellReuseIdentifier: CategoryListCell.id)
        categoryListView.register(UINib(nibName: CategoryListCell2.id, bundle: .main), forCellReuseIdentifier: CategoryListCell2.id)
    }
    
    func navigationBarSetup() {
        title = "Category"
        
        // Configure navigation items
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewCategory))
    }
    
}
