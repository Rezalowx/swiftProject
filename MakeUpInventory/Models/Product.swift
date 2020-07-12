//
//  File.swift
//  MakeUpInventory
//
//  Created by Grégory Brugnet on 10/07/2020.
//  Copyright © 2020 Grégory Brugnet. All rights reserved.
//

import Foundation

struct Product: Hashable, CustomStringConvertible, Identifiable, Comparable{
    
    

    enum Category: String, CaseIterable, Identifiable {
        case lipstick, glitter, liner, pencil, palette, nailPolish
        var id: Category {
            return self
        }
    }
    
    var description: String {
        return "\(name) : \(price)€"
    }
    
    static func < (lhs: Product, rhs: Product) -> Bool {
        return lhs.name < rhs.name
    }
    
    let id = UUID()
    var name: String
    let brand: String
    let color: String
    var price: Double
    var note = 0
    let category: Category
    var imageURL: String?	
    
    
    
}



