//
//  GameClass.swift
//  Pig_Roulette
//
//  Created by Mupparapu, Srujan on 9/25/19.
//  Copyright © 2019 Vadlakonda, Sujay V. All rights reserved.
//

import Foundation

class PigGame {
    
    let numberOfPlayers: Int
    let goalPoints: Int
    let maxDice: Int
    
    var players: [Player]
    var currentPlayer: Int
    
    init(numberOfPlayers: Int, goalPoints: Int, maxDice: Int) {
        self.numberOfPlayers = numberOfPlayers
        self.goalPoints = goalPoints
        self.maxDice = maxDice
        
        self.players = []
        for num in 1...numberOfPlayers {
            players.append(Player(name: "Player \(num)", points: 0))
        }
        currentPlayer = 0
    }
    
    func roll() -> Int {
        return Int.random(in: 1...6)
    }
    
    func nextPlayer() {
        currentPlayer += 1
        if currentPlayer == numberOfPlayers {
            currentPlayer = 0
        }
    }
    
    func updatePlayer(earnedPoints: Int) -> Bool {
        players[currentPlayer].points += earnedPoints
        return players[currentPlayer].points >= goalPoints
    }
    
}

class Player {
    
    let name: String
    var points: Int
    
    init(name: String, points: Int) {
        self.name = name
        self.points = points
    }

}
