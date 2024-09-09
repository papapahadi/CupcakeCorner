//
//  Order.swift
//  CupcakeCorner
//
//  Created by Jatin Singh on 09/09/24.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name : String = ""
    var streetAddress : String = ""
    var city : String = ""
    var zip : String = ""
    
    var hasValidAddress : Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        return true
    }
    
    var cost : Decimal {
        //2$ per cake
        var cost = Decimal(quantity) * 2
        cost += Decimal(type) / 2
        //1$ per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        //0.5$ per cake for sprinkles
        if addSprinkles {
            cost += Decimal(quantity) / 2
        }
        return cost
    }
}
