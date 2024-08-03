//
//  LogView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI


struct LogView: View {
    
    @State private var date = Date()
    @State private var selectedCategory = "Drink"
    var categories = ["Drink", "Shower", "Cleaning"]
    @State private var repeated = 0
    @State private var showAddSheet = false
    @State private var categoryName = ""
    
    
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
                    VStack {
                        ForEach(categories, id: \.self) { categories in
                            Text(categories)
                            Spacer()
                            Button("Add category") {
                            }
                            .sheet(isPresented: $showAddSheet, content: {
                                HStack{
                                    TextField("Enter category name", text: $categoryName)
                                        .padding()
                                    Button {
                                        categories.append(categoryName)
                                    } label: {
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                }
                            })
                        }
                    }
                }
            }
        }
    }
}

#Preview{
    LogView()
}
