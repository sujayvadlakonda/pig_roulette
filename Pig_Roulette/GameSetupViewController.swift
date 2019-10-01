//
//  GameSetupViewController.swift
//  Pig_Roulette
//
//  Created by Vadlakonda, Sujay V on 9/27/19.
//  Copyright © 2019 Vadlakonda, Sujay V. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet var pointPicker: UIPickerView!
    var pointPickerData: [Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pointPicker.delegate = self
        self.pointPicker.dataSource = self
        
        var x = 20
        while x <= 100 {
            pointPickerData.append(x)
            x += 5
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pointPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pointPickerData[row])
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}
