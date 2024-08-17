//
//  HomeView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation
import SwiftUI

class Tracking: ObservableObject {
    @Published var fixtureConsumptionRate: Double = 0.0
    @Published var log: [LogEntry] = []
}

struct LogEntry: Identifiable {
    var id = UUID()
    var category: String
    var value: Double
    var date: Date
}

struct HomeView: View {
    @ObservedObject var trackingData: Tracking

    init(trackingData: Tracking = Tracking()) {
        self.trackingData = trackingData
    }
    
    @State private var logSheetShown = false

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.mint)
                    .padding(.leading)
                    .padding(.top, 20)
                
                VStack(spacing: 10) {
                    HStack(spacing: 3){
                        Text("Water used")
                        Text("this week")
                            .foregroundColor(.mint)
                            .font(.system(size: 17, weight: .bold))
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                    Text("\(trackingData.fixtureConsumptionRate, specifier: "%.0f") litres")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.mint)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("TODAY")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    ForEach(todayEntries()) { entry in
                        VStack(alignment: .leading) {
                            Text("\(entry.value, specifier: "%.1f") litres")
                                .foregroundColor(.mint)
                            Text(entry.category)
                                .font(.caption)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("YESTERDAY")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("480ml")
                                .foregroundColor(.mint)
                            Text("Drink, 2 cups")
                                .font(.caption)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("65 litres")
                                .foregroundColor(.mint)
                            Text("Shower, 5 minutes")
                                .font(.caption)
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    Button {
                        logSheetShown = true
                    } label: {
                        HStack{
                            Image(systemName: "plus.app")
                                .foregroundStyle(.mint)
                                .bold()
                            Text("Log new")
                                .foregroundStyle(.mint)
                                .bold()
                        }
                    }   .padding()
                        .sheet(isPresented: $logSheetShown, content: {
                            LogView(sheetShown: $logSheetShown)
                        })
                    
                    Spacer()
                }
                
                Text("Trends")
                    .font(.title2)
                    .padding(.top)
                
                HStack {
                    Text("Overall")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.mint)
                }.padding(.vertical, 5)
                
                HStack {
                    Text("Drinking")
                    Spacer()
                    Image(systemName: "arrow.down.right")
                        .foregroundColor(.red)
                }.padding(.vertical, 5)
                
                HStack {
                    Text("Showering")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.mint)
                }.padding(.vertical, 5)
            }   .padding(.horizontal)
                .padding(.top)
            
            Spacer()
        }
    }
    
    func todayEntries() -> [LogEntry] {
        let today = Calendar.current.startOfDay(for: Date())
        return trackingData.log.filter { Calendar.current.isDate($0.date, inSameDayAs: today)
        }
    }
}

#Preview {
    HomeView()
}
