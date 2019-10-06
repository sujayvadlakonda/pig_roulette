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
    @IBOutlet weak var dicePicker: UISegmentedControl!
    @IBOutlet var gameOverButton: UIButton!
    
    var game = PigGame(numberOfPlayers: 4, goalPoints: 100, maxDice: 4)
    var numRoundPoints = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        dicePicker.removeAllSegments()
        for i in 1...game.maxDice {
            dicePicker.insertSegment(withTitle: String(i), at: i-1, animated: true)
        }
        gameOverButton.isHidden = true
        resetUI()
    }

    @IBAction func rollPress(_ sender: Any) {
        resetDice()
        for dieNum in 1...(dicePicker.selectedSegmentIndex+1) {
            let val = game.roll()
            if (dieNum == 1) {
                dice1.image = rolImages(rolledNum: val)
            } else if (dieNum == 2) {
                dice2.image = rolImages(rolledNum: val)
            } else if (dieNum == 3) {
                dice3.image = rolImages(rolledNum: val)
            } else if (dieNum == 4) {
                dice4.image = rolImages(rolledNum: val)
            }
            if val == 1 {
                messageDisplay.text = "You rolled a one, too bad!!! No points awarded."
                numRoundPoints = 0
                //nextPlayer()
                rollButton.isEnabled = false
                return
            }

            numRoundPoints += val
            roundPoints.text = String(numRoundPoints)
        }
        
    }

    @IBAction func nextPlayer(_ sender: Any) {
        nextPlayer()
    }
    
    func nextPlayer() {
        if (game.updatePlayer(earnedPoints: numRoundPoints)) {
            gameOverButton.isHidden = false
            messageDisplay.isHidden = true
        } else {
            game.nextPlayer()
            resetUI()
        }
    }

    func resetUI() {
        numRoundPoints = 0
        rollButton.isEnabled = true
        playerTitle.text = "\(game.players[game.currentPlayer].name)'s Turn"
        totalPoints.text = "\(game.players[game.currentPlayer].points)"
        roundPoints.text = "0"
        resetDice()
        dicePicker.selectedSegmentIndex = 0
        messageDisplay.text = "Go ahead and roll, \(game.players[game.currentPlayer].name)"
    }
    
    func resetDice() {
        dice1.image = nil
        dice2.image = nil
        dice3.image = nil
        dice4.image = nil
    }

    func rolImages(rolledNum: Int) -> UIImage {
        switch rolledNum {
        case 1:
            return UIImage(named: "face1")!
        case 2:
            return UIImage(named: "face2")!
        case 3:
            return UIImage(named: "face3")!
        case 4:
            return UIImage(named: "face4")!
        case 5:
            return UIImage(named: "face5")!
        case 6:
            return UIImage(named: "face6")!
        default:
            return UIImage(named: "face1")!
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.destination is LeaderboardViewController) {
            (segue.destination as! LeaderboardViewController).currentGame = game
        } else {
            (segue.destination as! GameOverViewController).winningPlayer = game.players[game.currentPlayer]
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
}
