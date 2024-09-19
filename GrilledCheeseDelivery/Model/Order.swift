//
//  Order.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/19/24.
//

import Foundation
import SwiftUI
// observable object = used so that changes that are made occur immediately, we dont want our users to refresh manually
class Order: ObservableObject {
    // static = variables whose values are shared among all the objects of class. @published = triggers a redraw when changes occur
    // represents that available types of bread for ordering'
    // static var like 'types' belong to the 'order' type itself, shared among all instances of 'order'
    static let types = ["Soft", "Tough", "Gluten-Free"]
    
    @Published var type = 0
    @Published var quantity = 1
    @Published var sourDough = false
    @Published var rolls = false
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zipCode = ""
    @Published var cellPhoneNumber = ""
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled {
                sourDough = false
                rolls = false
            }
        }
    }
}
