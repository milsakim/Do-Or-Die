//
//  Category.swift
//  DoOrDie
//
//  Created by HyeJee Kim on 2021/11/28.
//

import Foundation

class Category: NSObject {
    
    // MARK: - Property
    
    let id: UUID
    var title: String = "No Title"
    var subcategories: [Category] = []
    var level: Int = 0
    var isExpaned: Bool = false
    
    // MARK: - Initialization
    
    init(title: String?) {
        id = UUID()
        if let title: String = title {
            self.title = title
        }
        
        super.init()
    }
    
    // MARK: - Deinitialization
    
    deinit {
        if !subcategories.isEmpty {
            subcategories.removeAll()
        }
    }
    
}
 
