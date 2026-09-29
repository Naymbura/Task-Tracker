//
//  SwiftBasics.swift
//  Task Tracker
//
//  Created by MARYANN KIMANI on 28/09/2026.
//

import Playgrounds

#Playground {
    
    var playerName = "Nyambura"
    let maxScore = 100 // declared with let or constant cant be changed
    
    var age: Int = 28
    var price: Double = 19.99
    var isActive: Bool = false
    var message: String = "Hello, World!"
    
    var colors: [String] = ["Red", "Blue", "Green"]
    colors.append("White")
    
    // Dictionaries - store key value pairs
    var user: [String: String] = [
        "name": "Maryann",
        "role": "Developer"
    ]
    
    // Functions
    func greet() {
        print("Hello World!")
    }
    
    greet()
    
    func calculateTotal(price: Double, quantity: Int) -> Double {
        return price + Double(quantity)
    }
    
    calculateTotal(price: 29.99, quantity: 7)
}
