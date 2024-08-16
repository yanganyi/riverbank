//
//  HomeView.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//


// === OLD CODE AT THE BOTTOM ===

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
                    HStack {
                        Text("Water used")
                        Text("This week")
                            .foregroundColor(.mint)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
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
                
                Text("Trends")
                    .font(.title2)
                    .padding(.top)
                
                HStack {
                    Text("Overall")
                    Spacer()
                    Image(systemName: "arrow.up.right")
                        .foregroundColor(.green)
                }
                .padding(.vertical, 5)
                
                HStack {
                    Text("Drinking")
                    Spacer()
                    Image(systemName: "arrow.down.right")
                        .foregroundColor(.red)
                }
                .padding(.vertical, 5)
            }
            .padding(.horizontal)
            .padding(.top)
            
            Spacer()
        }
    }
    
    func todayEntries() -> [LogEntry] {
        let today = Calendar.current.startOfDay(for: Date())
        return trackingData.log.filter { Calendar.current.isDate($0.date, inSameDayAs: today) }
    }
}

#Preview {
    HomeView()
}




// === OLD CODE ===



//import Foundation
//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            VStack(alignment: .leading, spacing: 20) {
//                Text("Home")
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .foregroundColor(.mint)
//                    .padding(.leading)
//                    .padding(.top, 20)
//
//                VStack(spacing: 10) {
//                    HStack {
//                        Text("Water used")
//                        Text("This week")
//                            .foregroundColor(.mint)
//                    }
//                    .frame(maxWidth: .infinity, alignment: .center)
//
//                    Text("144 litres")
//                        .font(.system(size: 40, weight: .bold))
//                        .foregroundColor(.mint)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                }
//
//                VStack(alignment: .leading, spacing: 15) {
//                    Text("TODAY")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//
//                    VStack(alignment: .leading, spacing: 10) {
//                        VStack(alignment: .leading) {
//                            Text("60 litres")
//                                .foregroundColor(.mint)
//                            Text("Shower, 5 minutes")
//                                .font(.caption)
//                        }
//                        VStack(alignment: .leading) {
//                            Text("240ml")
//                                .foregroundColor(.mint)
//                            Text("Drink, 1 cup")
//                                .font(.caption)
//                        }
//                    }
//                }
//
//                VStack(alignment: .leading, spacing: 15) {
//                    Text("YESTERDAY")
//                        .font(.caption)
//                        .foregroundColor(.gray)
//
//                    VStack(alignment: .leading, spacing: 10) {
//                        VStack(alignment: .leading) {
//                            Text("480ml")
//                                .foregroundColor(.mint)
//                            Text("Drink, 2 cups")
//                                .font(.caption)
//                        }
//                        VStack(alignment: .leading) {
//                            Text("65 litres")
//                                .foregroundColor(.mint)
//                            Text("Shower, 5 minutes")
//                                .font(.caption)
//                        }
//                    }
//                }
//
//                Text("Trends")
//                    .font(.title2)
//                    .padding(.top)
//
//                HStack {
//                    Text("Overall")
//                    Spacer()
//                    Image(systemName: "arrow.up.right")
//                        .foregroundColor(.green)
//                }
//                .padding(.vertical, 5)
//
//                HStack {
//                    Text("Drinking")
//                    Spacer()
//                    Image(systemName: "arrow.down.right")
//                        .foregroundColor(.red)
//                }
//                .padding(.vertical, 5)
//            }
//            .padding(.horizontal)
//            .padding(.top)
//
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}
