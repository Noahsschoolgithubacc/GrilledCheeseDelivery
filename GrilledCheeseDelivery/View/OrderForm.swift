//
//  OrderForm.swift
//  GrilledCheeseDelivery
//
//  Created by PM Student on 9/19/24.
//

import SwiftUI

struct OrderForm: View {
    
    @ObservedObject var order = Order()
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section {
                    Picker("Select bread type", selection: $order.type) {
                        ForEach(0..<Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper(value: $order.quantity, in: 1...10) {
                        Text("Number of bread loaves: \(order.quantity)")
                    }
                    
                }
                
                Section {
                    Toggle(isOn:
                            $order.specialRequestEnabled.animation()) {
                        Text("Add special request")
                    }
                    
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.sourDough) {
                            Text("Make it sourdough")
                        }
                        
                        if order.specialRequestEnabled {
                            Toggle(isOn: $order.rolls) {
                                Text("Make it rolls")
                            }
                            // control + shift + i = reformats code on xcode
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Bread delivery")
        }
    }
}


#Preview {
    OrderForm()
}
