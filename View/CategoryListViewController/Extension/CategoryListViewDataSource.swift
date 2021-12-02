//
//  CategoryListViewDatasource.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import Foundation
import UIKit

extension CategoryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 10 {
            print("Yayyyy")
        }
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CategoryListCell2 = tableView.dequeueReusableCell(withIdentifier: CategoryListCell2.id, for: indexPath) as? CategoryListCell2 else {
            fatalError("fail to dequeue cell")
        }
        
        cell.configure(categories[indexPath.row])
        cell.delegate = self
        
        /*
        guard let cell: CategoryListCell = tableView.dequeueReusableCell(withIdentifier: CategoryListCell.id, for: indexPath) as? CategoryListCell else {
            fatalError("fail to dequeue cell")
        }
        
        cell.titleLabel.text = categories[indexPath.row].title
        cell.delegate = self
        cell.data = categories[indexPath.row].subcategories
        
        print("table view content height: \(cell.subCategoryListView.contentSize.height)")
        */
        /*
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: categoryListCellID, for: indexPath)
        
        var contentConfig: UIListContentConfiguration = cell.defaultContentConfiguration()
        contentConfig.text = categories[indexPath.row].title
        
        cell.indentationLevel = categories[indexPath.row].level * 1
        
        cell.contentConfiguration = contentConfig
        */
        
        return cell
    }

}

extension CategoryListViewController {
    
    func dfs() {
        print("--- dfs ---")
        var stack: [Category] = []
        var categoryHierarchy: [Category] = []
        
        for topCategory in categories.reversed() {
            stack.append(topCategory)
        }
        
        while !stack.isEmpty {
            let current: Category = stack.removeLast()
            print("current: \(current.title)")
            categoryHierarchy.append(current)
            
            print(categoryHierarchy.reduce("", { $0 + $1.title + ", "}))
            
            for subCategory in current.subcategories.reversed() {
                stack.append(subCategory)
            }
            
            print("stack: " + stack.reduce("", { $0 + $1.title + ", "}) + "\n")
        }
        
        categories = categoryHierarchy
        
        return
    }
    
}
