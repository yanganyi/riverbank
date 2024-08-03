//
//  WelcomeScreen.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI


struct WelcomeScreen: View {
    @Binding var currentStep: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome to Riverbank!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.teal)
                .padding(.bottom, 50)
                .padding(.horizontal, 30)
            
            
            VStack(alignment: .leading, spacing: 20) {
                FeatureView(imageName: "drop.fill", title: "Water", description: "Save water efficiently by using our app.")
                FeatureView(imageName: "chart.pie.fill", title: "Charts", description: "See your daily, weekly, or even monthly progress of water saving.")
                FeatureView(imageName: "star.fill", title: "Goals", description: "Customise your goals.")
                FeatureView(imageName: "pencil.line", title: "Log", description: "Enter your daily water usage.")
            }
            .padding(.horizontal, 30)
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                currentStep = 2
            }) {
                Text("Continue")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
    }
}

struct WelcomeInputScreen: View {
    @Binding var currentStep: Int
    
    @State private var waterCostPerLitre: String = ""
    @State private var selectedCurrency: String = "USD"
    let currencies = ["USD", "SGD", "EUR"]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Enter details")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.teal)
                .padding(.bottom, 20)
            
            Text("Before you begin using our app, please fill in a few details:")
                .font(.subheadline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    TextField("              Water Cost Per Litre", text: $waterCostPerLitre)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .foregroundColor(.black)
                }
                
                HStack {
                    Spacer()
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
                    Spacer()
                }
            }
            .padding(.horizontal, 30)
            .foregroundColor(.black)
            
            Spacer()
            
            Button(action: {
                currentStep = 3
            }) {
                Text("Start using our app")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.teal)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 20)
        }
        .padding()
    }
}

struct FeatureView: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text(description)
                    .font(.subheadline)
                    .lineLimit(nil)
            }
            .padding(.leading, 10)
        }
    }
}


struct SubContentView: View {
    @State private var currentStep = 1
    
    var body: some View {
        VStack {
            if currentStep == 1 {
                WelcomeScreen(currentStep: $currentStep)
            } else if currentStep == 2 {
                WelcomeInputScreen(currentStep: $currentStep)
            } else {
                ContentView()
            }
        }
    }
}


#Preview {
    SubContentView()
}

