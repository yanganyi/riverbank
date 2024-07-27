//
//  ContentView.swift
//  riverbank
//
//  Created by Dhanush  on 20/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                Label("Home", image: "house.fill")
                }
            UsageView()
                .tabItem {
                    Label("Usage", systemImage: "chart.pie")
                }
            GoalsView()
                .tabItem {
                    Label("Goals", systemImage: "star")
                
                }
            SetingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
