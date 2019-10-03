//
//  GameOverViewController.swift
//  Pig_Roulette
//
//  Created by Vadlakonda, Sujay V on 10/3/19.
//  Copyright © 2019 Vadlakonda, Sujay V. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    var winningPlayer = Player(name: "Bob", points: 30)

    @IBOutlet var playerWonText: UILabel!
    @IBOutlet var pointsText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        playerWonText.text = "\(winningPlayer.name) Won!"
        pointsText.text = "\(winningPlayer.points) Points"
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
