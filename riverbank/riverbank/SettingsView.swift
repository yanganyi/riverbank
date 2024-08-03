//
//  SettingsView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    
    @State private var waterCostPerLitre: String = ""
    @State private var selectedCurrency: String = "USD"
    let currencies = ["SGD", "USD", "EUR"]
    
    var body: some View {
        VStack {
            TextField("Water Cost Per Litre", text: $waterCostPerLitre)
                .keyboardType(.decimalPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(.black)

            Picker("Local currency", selection: $selectedCurrency) {
                ForEach(currencies, id: \.self) { currency in
                    Text(currency)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .foregroundColor(.black)
        }
    }
}

#Preview {
    SettingsView()
}
