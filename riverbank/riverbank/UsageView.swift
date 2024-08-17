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
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.red,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )   .rotationEffect(.degrees(-90))
                            .animation(.easeOut, value: progress)
                    
                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.blue,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )   .rotationEffect(.degrees(-45))
                            .animation(.easeOut, value: progress2)
                    Text("40%")
                        .font(.title2)
                        .foregroundColor(Color.black)
                    
                }.padding(20)
                
                HStack {
                    Text("Drinking").foregroundColor(.red)
                    Spacer()
                    Text("10%")
                }   .padding(35)
                    .padding(.bottom, -60)
                
                HStack {
                    Text("Showering")
                        .foregroundColor(.blue)
                    Spacer()
                    Text("30%")
                }   .padding(35)
                    .padding(.bottom, -25)
                
                Spacer()
                
                List {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("480ml")
                                    .foregroundColor(.mint)
                                Text("Drink, 2 cups")
                                    .font(.caption)
                            }
                            Spacer()
                            Button("Edit") {}
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("65 litres")
                                    .foregroundColor(.mint)
                                Text("Shower, 5 minutes")
                                    .font(.caption)
                            }
                            Spacer()
                            Button("Edit") {}
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    UsageView()
}
