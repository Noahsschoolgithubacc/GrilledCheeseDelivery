//
//  CheckoutView.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/23/24.
//

import SwiftUI

struct CheckoutView: View {
    
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Thank you for the order")
    }
}

#Preview {
    CheckoutView(order: Order())
}
