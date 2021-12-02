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
        categories = c1 + categories[indexPath.row].subcategories + c2
        
        return ((indexPath.row + 1)..<(indexPath.row + 1 + categories[indexPath.row].subcategories.count)).map { IndexPath(row: $0, section: indexPath.section) }
    }
    
    func collapse(_ indexPath: IndexPath) -> [IndexPath] {
        var numberOfSubcategories: Int = categories[indexPath.row].subcategories.count
        let c1 = categories[0...indexPath.row]
        
        categories[indexPath.row].subcategories.forEach {
            if $0.isExpaned {
                numberOfSubcategories += $0.subcategories.count
                $0.isExpaned = false
            }
        }
        
        let c2 = categories[(indexPath.row + 1 + numberOfSubcategories)...]
        categories = Array(c1 + c2)
        
        return  ((indexPath.row + 1)..<(indexPath.row + 1 + numberOfSubcategories)).map { IndexPath(row: $0, section: indexPath.section) }
    }
    
}
