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
    @State private var selectedCurrency: String = "SGD"
    let currencies = ["SGD", "USD", "EUR"]
    @State private var savedAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Settings")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.mint)
                .padding(.bottom, 20)
            
            TextField("Water Cost Per Litre", text: $waterCostPerLitre)
                .keyboardType(.decimalPad)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(.black)

            HStack {
                Text("Currency:")
                
                Picker("Local currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .padding(3)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .foregroundColor(.black)
            }
            
            Button {
                
            } label: {
                HStack{
                    Image(systemName: "checkmark")
                    Text("Save")
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, alignment: .center)
            .alert("Saved Settings!", isPresented: $savedAlert) {
                Button("Ok") { }
            }
            
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
