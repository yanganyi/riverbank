//
//  UsageView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
// for timothy to do

import Foundation
import SwiftUI

struct UsageView: View {
    @State var progress = 0.47
    //change with water or some other var aft coordinating with backend
    var body: some View {
        
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
                        Color.mint,
                        style: StrokeStyle(
                            lineWidth: 30,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                // 1
                    .animation(.easeOut, value: progress)
                
                
                
                Text("Used(insert amt here)")
                //use string interpolation here
                    .font(.title2)
                    .foregroundColor(Color.black)
                
            }
            .padding(20)
            .navigationTitle("Usage")
            HStack {
                Text("Category Name")
                Spacer()
                Text("perecentage%")
            }
            // to be hooked up to data after clarifying
               
            Spacer()
            
            List {
                HStack {
                    VStack {
                        Text("amt")
                            .bold()
                        //fix this crappy ahh alignment
                        Text("name of category")
                    }
                    Spacer()
                    Button("Edit>") {
                        //insert code to toggle editing sheet here
                        //i also might wanna use the other button variant (the one with label:) to get the arrow idk
                    }
                    
                }
                //repeat for every category
            }
            
        }
        
        
        
    }
}
#Preview {
    UsageView()
}
