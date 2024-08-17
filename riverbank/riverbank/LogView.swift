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
    @State private var categories = ["Drink", "Shower", "Cleaning"]
    @State private var repeated = 0
    @State private var showAddSheet = false
    @State private var categoryName = ""
    @Binding var sheetShown: Bool
    
    var body: some View {
        VStack{
            List {
                DatePicker(
                    "Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(categories, id: \.self) {category in
                        Text(category).tag(category)
                    }
                }
                
                Button("Add category") { showAddSheet = true}
                    .foregroundStyle(.mint)
                    .sheet(isPresented: $showAddSheet, content: {
                        VStack {
                            TextField("Enter category name", text: $categoryName).padding()
                            Button {
                                if !categoryName.isEmpty {
                                    categories.append(categoryName)
                                    categoryName = ""
                                    showAddSheet = false
                                }
                            } label: { Text("Add") }.padding()
                        }.padding()
                    })
            }
            
            Button {
                sheetShown = false
            } label: {
                HStack{
                    Image(systemName: "checkmark")
                    Text("Log")
                }
            }   .foregroundStyle(.mint)
                .bold()
                .font(.title2)
        }   .background(Color(.systemGray6))
    }
}
