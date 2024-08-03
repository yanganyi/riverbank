import SwiftUI

struct GoalsView: View {
    @State private var goalText: String = ""
    @State private var goals: [String] = [
        "Water Consumption",
        "Shower",
        "Cleaning",
        "Miscellaneous"
    ]
    @State private var progressValues: [String: Double] = [
        "Water Consumption": 0.5, // Example progress values
        "Shower": 0.3,
        "Cleaning": 0.8,
        "Miscellaneous": 0.1
    ]

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Goals")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.teal)
                    .padding(.leading)
                    .padding(.top, 20)

                VStack(spacing: 20) {
                    ForEach(goals, id: \.self) { goal in
                        HStack {
                            Button(action: {
                                // Replace with desired action for the goal
                                handleGoalButtonTap(goal)
                            }) {
                                HStack {
                                    Text(goal)
                                        .padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)

                                    VStack {
                                        GeometryReader { geometry in
                                            let progressHeight = CGFloat(progressValues[goal] ?? 0.0) * geometry.size.height
                                            VStack {
                                                Spacer()
                                                Rectangle()
                                                    .fill(Color.blue)
                                                    .frame(width: 20, height: progressHeight)
                                            }
                                        }
                                    }
                                    .frame(width: 20, height: 60)
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(5)
                                    .padding(.trailing)
                                }
                                .frame(height: 80)
                                .background(Color.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.blue, lineWidth: 2)
                                )
                            }
                            .buttonStyle(PlainButtonStyle()) // Use plain style to avoid default button styling
                        }
                    }
                }
                .padding()

                HStack {
                    TextField("Enter new goal", text: $goalText, onCommit: {
                        addGoal()
                    })
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .frame(height: 40)

                    Button(action: {
                        addGoal()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                            .padding(.trailing)
                    }
                }
                .padding(.leading)
                .padding(.trailing)

                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding()
        }
    }

    // Function to handle goal button tap
    func handleGoalButtonTap(_ goal: String) {
        print("\(goal) button tapped")
        // Add your desired functionality here
    }

    // Function to add a new goal
    func addGoal() {
        guard !goalText.isEmpty else { return }
        goals.append(goalText)
        progressValues[goalText] = 0.0
        goalText = ""
    }
}

struct GoalsView_Previews: PreviewProvider {
    static var previews: some View {
        GoalsView()
    }
}
