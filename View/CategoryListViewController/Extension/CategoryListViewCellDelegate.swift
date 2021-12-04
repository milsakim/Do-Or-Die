//
//  CategoryListViewCellDelegate.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import UIKit

extension CategoryListViewController: CategoryListCellDelegate {
    
    func disclosureButtonDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.categoryListView.performBatchUpdates(nil)
        }
    }
    
}

extension CategoryListViewController: CategoryListCell2Delegate {
    
    func tapSubcategoryButton(sender: CategoryListCell2) {
        guard let indexPath: IndexPath = categoryListView.indexPath(for: sender) else {
            return
        }
        
        if categories[indexPath.row].subcategories.count == 0 {
            return
        }
        // If the selected category is expanded
        if categories[indexPath.row].isExpaned {
            let deleted: [IndexPath] = collapse(indexPath)
            categories[indexPath.row].isExpaned = false
            sender.subcategoryButton.setImage( UIImage(systemName: "arrowtriangle.right"), for: .normal)
            categoryListView.deleteRows(at: deleted, with: .fade)
        }
        else {  // If the selected category is collapsed
            let inserted: [IndexPath] = expand(indexPath)
            categories[indexPath.row].isExpaned = true
            sender.subcategoryButton.setImage( UIImage(systemName: "arrowtriangle.down"), for: .normal)
            categoryListView.insertRows(at: inserted, with: .fade)
        }
    }
    
}

extension CategoryListViewController {
    
    func expand(_ indexPath: IndexPath) -> [IndexPath] {
        let c1 = categories[0...indexPath.row]
        let c2 = categories[(indexPath.row + 1)...]
        
        var stack: [Category] = categories[indexPath.row].subcategories.reversed()
        var willAdded: [Category] = []
        
        while !stack.isEmpty {
            let currentCategory: Category = stack.removeLast()
            willAdded.append(currentCategory)
            
            if currentCategory.isExpaned {
                stack += currentCategory.subcategories.reversed()
            }
        }
        
//        categories = c1 + categories[indexPath.row].subcategories + c2
        categories = c1 + willAdded + c2
        
//        return ((indexPath.row + 1)..<(indexPath.row + 1 + categories[indexPath.row].subcategories.count)).map { IndexPath(row: $0, section: indexPath.section) }
        return ((indexPath.row + 1)..<(indexPath.row + 1 + willAdded.count)).map { IndexPath(row: $0, section: indexPath.section) }
    }
    
    func collapse(_ indexPath: IndexPath) -> [IndexPath] {
        var numberOfSubcategories: Int = 0
        
        var queue: [Category] = categories[indexPath.row].subcategories
        
        while !queue.isEmpty {
            let currentCategory: Category = queue.removeFirst()
            print(currentCategory.title)
            numberOfSubcategories += 1
            
            if currentCategory.isExpaned {
                queue += currentCategory.subcategories
//                currentCategory.isExpaned = false
            }
        }

        let c1 = categories[0...indexPath.row]
        let c2 = categories[(indexPath.row + 1 + numberOfSubcategories)...]
        categories = Array(c1 + c2)
        
        return  ((indexPath.row + 1)..<(indexPath.row + 1 + numberOfSubcategories)).map { IndexPath(row: $0, section: indexPath.section) }
    }
    
}
