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
    @State private var categories = [
        "Drink",
        "Shower",
        "Cleaning"]
    @State private var repeated = 0
    @State private var showAddSheet = false
    @State private var categoryName = ""
    var tag = 0
    
    var body: some View {
        VStack{
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
                    ForEach(categories, id: \.self) { category in
                        Text(category).tag(category)
                    }
                }
                
                Button("Add category") {
                    showAddSheet = true
                }
                .foregroundStyle(.mint)
                .sheet(isPresented: $showAddSheet, content: {
                    VStack {
                        TextField("Enter category name", text: $categoryName)
                            .padding()
                        Button {
                            if !categoryName.isEmpty {
                                categories.append(categoryName)
                                categoryName = ""
                                showAddSheet = false
                            }
                        } label: {
                            Text("Add")
                        }
                        .padding()
                    }
                    .padding()
                })
            }
            Button {
                //log (idk code)
            } label: {
                HStack{
                    Image(systemName: "checkmark")
                    Text("Log")
                }
            }
            .foregroundStyle(.mint)
            .bold()
            .font(.title2)
        }
        .background(Color(.systemGray6))
    }
}

#Preview {
    LogView()
}
