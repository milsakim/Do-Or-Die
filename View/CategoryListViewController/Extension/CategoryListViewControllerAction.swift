//
//  CategoryListViewControllerAction.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/12/02.
//

import UIKit

extension CategoryListViewController {
    
    @objc func addNewCategory() {
        let alertController: UIAlertController = UIAlertController(title: "Add New Category", message: nil, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: { textField in
            textField.placeholder = "Category Name"
        })
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let addAction: UIAlertAction = UIAlertAction(title: "Add", style: .default, handler: { addAction in
            guard let textField: UITextField = alertController.textFields?.first else {
                return
            }
            guard let text: String = textField.text else {
                return
            }
            
            let title: String? = text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : text.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Add new category
            guard let current = self.currentSelected else { return }
            let newCategory = Category(title: title)
            newCategory.level = self.categories[current.row].level + 1
            
            var willInsert: [IndexPath] = []
            
            if !self.categories[current.row].isExpaned {
                willInsert += self.expand(current)
                self.categories[current.row].isExpaned = true
            }
            
            self.categories[current.row].subcategories.append(newCategory)
            self.categories.insert(newCategory, at: current.row + self.categories[current.row].subcategories.count)
            
            willInsert += [IndexPath(row: current.row + self.categories[current.row].subcategories.count, section: current.section)]
            self.categoryListView.insertRows(at: willInsert, with: .fade)
            self.categoryListView.reloadRows(at: [current], with: .none)
//            self.categories.append(Category(title: title))
            // Reload table view
//            self.categoryListView.reloadData()
        })
        alertController.addAction(addAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
