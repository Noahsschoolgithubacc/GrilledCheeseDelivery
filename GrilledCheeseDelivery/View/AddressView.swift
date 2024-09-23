//
//  AddressView.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/23/24.
//

import SwiftUI

struct AddressView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Form {
            
            Section {
                
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zipCode)
                TextField("Phone Number", text: $order.cellPhoneNumber)
            }
        }
    }
}

#Preview {
    AddressView(order: Order())
}
