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
    @Published var waterCost: Double
    @Published var localCurrency: Int // 1 for sgd, 2 for usd, 3 for eur
    @Published var fixtureConsumptionRate: Double
    
    let waterCostKey = "water-cost-key"
    let localCurrencyKey = "local-currency-key"
    let fixtureConsumptionRateKey = "water-cost-key"
    
    let defaultInput = UserDefaults.standard
    let defaultShow = UserDefaults.standard
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    
    init() {
        var water = 0.0
        var loc = 0
        var fix = 0.0
        
        if let savedInput = defaultInput.object(forKey: waterCostKey) as? Data {
            if let loadedInput = try? decoder.decode(Double.self, from: savedInput) {
                print("this is loaded input", loadedInput)
                water = loadedInput
            }
        }
        
        if let savedInput = defaultInput.object(forKey: localCurrencyKey) as? Data {
            if let loadedInput = try? decoder.decode(Int.self, from: savedInput) {
                print("this is loaded input", loadedInput)
                loc = loadedInput
            }
        }
        
        if let savedInput = defaultInput.object(forKey: fixtureConsumptionRateKey) as? Data {
            if let loadedInput = try? decoder.decode(Double.self, from: savedInput) {
                print("this is loaded input", loadedInput)
                fix = loadedInput
            }
        }
        
        self.waterCost = water
        self.localCurrency = loc
        self.fixtureConsumptionRate = fix
    }
    
    func save() {
        if let encoded = try? encoder.encode(waterCost) {
            defaultInput.set(encoded, forKey: waterCostKey)
        }
        
        if let encoded = try? encoder.encode(localCurrency) {
            defaultInput.set(encoded, forKey: localCurrencyKey)
        }
        
        if let encoded = try? encoder.encode(fixtureConsumptionRate) {
            defaultInput.set(encoded, forKey: fixtureConsumptionRateKey)
        }
    }

    class tracking {
        @Published var log: [logStruct] { didSet{ save() } }
        // log is the 
        @Published var perCatTrack: [String: Int] { didSet { save() } }
        @Published var perCatGoal: [String: Int] { didSet { save() } }
        // perCat = per category
        // bascially a object where the key is the name of the category and the int is the number
        
        let logKey = "log-key"  
        let perCatTrackKey = "per-cat-track-key"
        let perCatGoalKey = "per-cat-goal-key"
        
        let defaultInput = UserDefaults.standard
        let defaultShow = UserDefaults.standard
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        init() {
            var cat = [logStruct(category: "", date: Date.distantPast, value: 0)]
            var track = ["empty":0]
            var goal = ["empty":0]
            
            if let savedInput = defaultInput.object(forKey: logKey) as? Data {
                if let loadedInput = try? decoder.decode([logStruct].self, from: savedInput) {
                    print("this is loaded input", loadedInput)
                    cat = loadedInput
                }
            }
            
            if let savedInput = defaultInput.object(forKey: perCatTrackKey) as? Data {
                if let loadedInput = try? decoder.decode([String: Int].self, from: savedInput) {
                    print("this is loaded input", loadedInput)
                    track = loadedInput
                }
            }
            
            if let savedInput = defaultInput.object(forKey: perCatGoalKey) as? Data {
                if let loadedInput = try? decoder.decode([String: Int].self, from: savedInput) {
                    print("this is loaded input", loadedInput)
                    goal = loadedInput
                }
            }
            
            self.log = cat
            self.perCatTrack = track
            self.perCatGoal = goal
        }
        
        func save() {
            if let encoded = try? encoder.encode(log) {
                defaultInput.set(encoded, forKey: logKey)
            }
            if let encoded = try? encoder.encode(perCatTrack) {
                defaultInput.set(encoded, forKey: perCatTrackKey)
            }
            if let encoded = try? encoder.encode(perCatGoal) {
                defaultInput.set(encoded, forKey: perCatGoalKey)
            }
        }
        
    }

}
