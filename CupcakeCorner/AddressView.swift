//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Jatin Singh on 09/09/24.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order : Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name ", text: $order.name)
                TextField("Street Address ", text: $order.streetAddress)
                TextField("City ", text: $order.city)
                TextField("Zip ", text: $order.zip)
            }
            
            Section {
                NavigationLink("Check Out ") {
                    CheckoutView(order: order)
                }
            }
            .disabled(!order.hasValidAddress)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
