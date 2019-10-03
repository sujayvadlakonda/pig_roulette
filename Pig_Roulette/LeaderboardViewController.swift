//
//  LeaderboardViewController.swift
//  Pig_Roulette
//
//  Created by Vadlakonda, Sujay V on 10/1/19.
//  Copyright © 2019 Vadlakonda, Sujay V. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    var currentGame = PigGame(numberOfPlayers: 4, goalPoints: 50, maxDice: 3)
    

    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var labelFour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numPlayers : Int = currentGame.players.count
        var players = currentGame.players
        players.sort(by: {$0.points < $1.points}) //Increasing Order Sort
        
        //Displays Leaderboard Labels
        var labels : [UILabel] = [UILabel]()
        labels.append(labelOne)
        labels.append(labelTwo)
        labelThree.isHidden = true
        labelFour.isHidden = true
        
        //Display labelThree if >2 Players
        if numPlayers > 2 {
            labelThree.isHidden = false
            labels.append(labelThree)
        }
        //Display labelFour if >3 Players
        if numPlayers > 3 {
            labelFour.isHidden = false
            labels.append(labelFour)
        }
        for index in (0...numPlayers - 1) {
            let player = players[index]
            labels[index].text = "\(player.name): \(player.points) Points"
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
