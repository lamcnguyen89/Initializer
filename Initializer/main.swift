//
//  main.swift
//  Initializer
//
//  Created by M_2022814 on 12/14/21.
//

import Foundation

// MARK: - Initialization
// Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
// The process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that's required before instance is ready to use.

// Syntax:
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("Fahrenheit: \(f.temperature)")

// MARK: - Deinitialization
// A Deinitializer is called immediately before a class instance is deallocated.
// Deinitializers are only available to class types

// Syntax:

class Bank {
    
    static var coinsInBank = 10000
    
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins : coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}
