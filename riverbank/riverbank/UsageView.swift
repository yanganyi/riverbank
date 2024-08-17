//
//  UsageView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
// for timothy to do

import Foundation
import SwiftUI

struct UsageView: View {
    @State var progress = 0.3
    @State var progress2 = 0.1
    @ObservedObject var trackingData: Tracking
    
    init(trackingData: Tracking = Tracking()) {
        self.trackingData = trackingData
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Usage")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.mint)
                .padding(.leading)
                .padding(.top, 20)
            NavigationStack{
                ZStack {
                    Circle()
                        .stroke(
                            Color.mint.opacity(0.5),
                            lineWidth: 30
                        )
<<<<<<< HEAD
                
                    
                    
=======
>>>>>>> main
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.green,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                    // 1
                        .animation(.easeOut, value: progress)
<<<<<<< HEAD
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.mint,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-45))
                    // 1
                        .animation(.easeOut, value: progress2)
                    
                    
                    
                    Text("40%")
=======
                    Text("used (insert amt here)")
>>>>>>> main
                    //use string interpolation here
                        .font(.title2)
                        .foregroundColor(Color.black)
                }
                .padding(20)
                HStack {
                    Text("Drinking")
                        .foregroundColor(.green)
                    Spacer()
                    Text("10 %")
                }.padding(20)
                HStack {
                    Text("Showering")
                        .foregroundColor(.mint)
                    Spacer()
                    Text("30 %")
                }.padding(20)
                // to be hooked up to data after clarifying
                Spacer()
                List {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("480ml")
                                    .foregroundColor(.green)
                                Text("Drink, 2 cups")
                                    .font(.caption)
                            }
                            Spacer()
                            Button("Edit") {
                                
                            }
                        }
                        HStack {
                            VStack(alignment: .leading) {
                                
                                Text("65 litres")
                                    .foregroundColor(.mint)
                                
                                
                                Text("Shower, 5 minutes")
                                    .font(.caption)
                            }
                            Spacer()
                            Button("Edit") {
                                
                            }
                        }
<<<<<<< HEAD
                    } //repeat for every category
=======
                    }
                    //repeat for every category
>>>>>>> main
                }
            }
        }
    }
}

#Preview {
    UsageView()
}
