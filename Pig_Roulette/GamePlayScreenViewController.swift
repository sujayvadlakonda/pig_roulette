//
//  GamePlayScreenViewController.swift
//  Pig_Roulette
//
//  Created by Mupparapu, Srujan on 9/27/19.
//  Copyright © 2019 Vadlakonda, Sujay V. All rights reserved.
//

import UIKit

class GamePlayScreenViewController: UIViewController {
    
    @IBOutlet weak var playerTitle: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var roundPoints: UILabel!
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var dice3: UIImageView!
    @IBOutlet weak var dice4: UIImageView!
    @IBOutlet weak var messageDisplay: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var endButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    
    let game = PigGame(numberOfPlayers: 4, goalPoints: 100, maxDice: 4)
    var numRoundPoints = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerTitle.text = "\(game.players[game.currentPlayer].name)'s Turn"
        totalPoints.text = "\(game.players[game.currentPlayer].points)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

    @IBAction func rollPress(_ sender: Any) {
        var pointsSum = 0
        for dieNum in 1...(game.maxDice) {
            let val = game.roll()
            if val == 1 {
                messageDisplay.text = "You rolled a one, too bad!!! No points awarded."
                return
            }
            pointsSum += val
            if (dieNum == 1) {
                // change image of dice1 to match rolled number
            } else if (dieNum == 2) {
                // change image of dice2 to match rolled number
            } else if (dieNum == 3) {
                // change image of dice3 to match rolled number
            } else if (dieNum == 4) {
                // change image of dice4 to match rolled number
            }
        }
    }
}
