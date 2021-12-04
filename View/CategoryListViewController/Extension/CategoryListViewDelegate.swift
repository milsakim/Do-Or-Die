//
//  CategoryListViewDelegate.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import Foundation
import UIKit

extension CategoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
        currentSelected = indexPath
    }
    
}
