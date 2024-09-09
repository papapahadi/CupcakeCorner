//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Jatin Singh on 07/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var order = Order()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes : \(order.quantity)", value: $order.quantity)
                }
                
                Section {
                    Toggle("Any Special Request", isOn: $order.specialRequestEnabled)
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra Frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra Sprinkles", isOn: $order.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink("Delivery details") {
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
