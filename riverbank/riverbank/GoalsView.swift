//
//  GoalsView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI

struct GoalsView: View {
    @State private var goalText: String = ""
    @State private var goals: [String] = [
        "Water Consumption",
        "Shower",
        "Cleaning",
        "Miscellaneous"
    ]
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) { // Align content to the leading edge
                Text("Goals")
                    .font(.largeTitle) // Set font size for the title
                    .fontWeight(.bold) // Make the title bold
                    .foregroundColor(.teal) // Set text color to teal
                    .padding(.leading) // Add padding to the leading side
                    .padding(.top, 20) // Add padding to the top

                // List to display the goals
                VStack(spacing: 20) { // Increased spacing for better visibility
                    ForEach(goals, id: \.self) { goal in
                        Text(goal)
                            .padding()
                            .frame(maxWidth: .infinity, minHeight: 80) // Increased height for the boxes
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2) // Maintain border thickness
                            )
                    }
                }
                .padding()

                // HStack for adding new goals, aligned to the left with extended length
                HStack {
                    TextField("Enter your goal", text: $goalText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .font(.headline)
                        .frame(maxWidth: .infinity) // Set the width to extend to fill the available space
                        .frame(height: 40) // Set the height separately

                    // Button to add the goal with an arrow icon
                    Button(action: addGoal) {
                        Label("Add Goal", systemImage: "arrow.right.circle.fill")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                    .padding(10) // Add padding around the button
                    .frame(minHeight: 40) // Set minimum height to match the new text field height
                    .background(Color.white) // Background color for the button
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2) // Border for the button
                    )
                }
                .padding(.top, 10) // Spacing above the add goal box
                .padding(.leading, 0) // No extra padding to ensure it starts at the left edge

                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Goal Added"),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
                }

                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline) // Remove the navigation bar title
            .padding()
        }
    }

    // Function to add a new goal
    func addGoal() {
        guard !goalText.isEmpty else { return }
        goals.append(goalText)
        alertMessage = "\(goalText) added!"
        showAlert = true
        goalText = ""
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
