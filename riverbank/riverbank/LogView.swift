//
//  LogView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI


struct category: Hashable, Identifiable {
    var id = UUID()
    var name: String
}

struct LogView: View {
    
    @State private var date = Date()
    @State private var selectedCategory = "Drink"
    var categories = ["Drink", "Shower", "Cleaning"]
    @State private var repeated = 0
    
    var body: some View {
        VStack {
            List {
                DatePicker(
                    "Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                
                Picker("Repeat", selection: $repeated) {
                    Text("Never").tag(0)
                    Text("Daily").tag(1)
                    Text("Weekly").tag(2)
                    Text("Monthly").tag(3)
                }
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) { categories in
                        Text(categories)
                    }
                    
                }
                
                
            }
        }
    }
}

#Preview{
    LogView()
}
