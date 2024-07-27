//
//  UsageView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI

struct UsageView: View {
    @State var progress = -0.1
    var body: some View {

        NavigationStack{
            if progress != -0.1 {
                ZStack {


                    Circle()
                        .stroke(
                            Color.mint.opacity(0.5),
                            lineWidth: 30
                        )


                    Circle()
                        .trim(from: 0, to: progress)
                        .stroke(
                            Color.mint,
                            style: StrokeStyle(
                                lineWidth: 30,
                                lineCap: .round
                            )
                        )
                        .rotationEffect(.degrees(-90))
                    // 1
                        .animation(.easeOut, value: progress)


                    // Transfer the data from HealthKit to the '100' part
                    Text("Steps 100/2000")
                        .font(.title2)
                        .foregroundColor(Color.black)

                }
                .padding(20)
                .navigationTitle("Home")

            } else {
                ProgressView()
                    .onAppear(perform: {
                        progress = 0.4


                        // add HealthKit retreving data here

                    })
            }
        }

      

    }
}
