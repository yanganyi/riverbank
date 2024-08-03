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
    @State private var showInputAlert: Bool = false
    @State private var progressValues: [String: Double] = [
        "Water Consumption": 0.5, // Example progress value
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
                            .frame(width: 20, height: 60) // Adjust the size of the progress bar
                            .background(Color.gray.opacity(0.3)) // Background for the progress bar
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
                }
                .padding()

                HStack {
                    Button(action: {
                        showInputAlert = true
                    }) {
                        Label("Add more goals", systemImage: "arrow.right.circle.fill")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 290, height: 40)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                }
                .padding(.top, 10)
                .padding(.leading)

                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Goal Added"),
                          message: Text(alertMessage),
                          dismissButton: .default(Text("OK")))
                }
                .alert(isPresented: $showInputAlert) {
                    Alert(
                        title: Text("New Goal"),
                        message: Text("Enter your goal:"),
                        primaryButton: .default(Text("Add")) {
                            addGoal()
                        },
                        secondaryButton: .cancel()
                    )
                }

                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .padding()
        }
    }

    func addGoal() {
        guard !goalText.isEmpty else { return }
        goals.append(goalText)
        progressValues[goalText] = 0.0
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
