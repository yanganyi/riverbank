//
//  LogView.swift
//  riverbank
//
//  Created by Timothy Laurentius on 27/7/24.
//

import Foundation
import SwiftUI

struct LogView: View {
    
    @State private var date = Date()
    @State private var category = 0
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
            }
        }
    }
}

#Preview{
    LogView()
}
