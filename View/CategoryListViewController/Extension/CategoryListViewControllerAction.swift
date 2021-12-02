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
            self.categories.append(Category(title: title))
            // Reload table view
            self.categoryListView.reloadData()
        })
        alertController.addAction(addAction)
        
        present(alertController, animated: true, completion: nil)
    }

}
