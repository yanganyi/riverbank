//
//  BackEnd.swift
//  riverbank
//
//  Created by Yang An Yi on 27/7/24.
//

import Foundation

struct logStruct: Codable {
    var category: String
    var date: Date
    var value: Int
}

class riverbank: ObservableObject {
    @Published var waterCost: Int
    @Published var localCurrency: String
    @Published var fixtureConsumptionRate: Double
    
    init() {
        var water = 0
        var loc = "0"
        var fix = 0.0
        
        // add save code later
        
        self.waterCost = water
        self.localCurrency = loc
        self.fixtureConsumptionRate = fix
    }

    class overallCateogry {
        @Published var category: [logStruct] { didSet{ save() } }
        
        let categoryKey = "category-overallCategory"
        
        let defaultInput = UserDefaults.standard
        let defaultShow = UserDefaults.standard
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        init() {
            var cat = [logStruct(category: "", date: Date.distantPast, value: 0)]
            
            if let savedInput = defaultInput.object(forKey: categoryKey) as? Data {
                if let loadedInput = try? decoder.decode([logStruct].self, from: savedInput) {
                    print("this is loaded input", loadedInput)
                    cat = loadedInput
                }
            }
            
            self.category = cat
        }
        
        func save() {
            if let encoded = try? encoder.encode(category) {
                defaultInput.set(encoded, forKey: categoryKey)
            }
        }
        
    }

}
