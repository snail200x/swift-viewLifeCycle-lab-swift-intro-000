//
//  ViewController.swift
//  FunWithViews
//
//  Created by Jim Campagno on 9/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var view7: UIView!
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    @IBOutlet weak var labelFour: UILabel!
    @IBOutlet weak var labelFive: UILabel!
    @IBOutlet weak var labelSix: UILabel!
    
    @IBOutlet weak var btnReset: UIButton!
    var diceTimes = 0
    
    @IBAction func btnRestAction(_ sender: Any) {
        resetDiceViews()
        resetLabelView()
        btnReset.isHidden = true
        diceTimes = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetDiceViews()
        resetLabelView()
    }
    
    @IBAction func dieButtonTapped(_ sender: AnyObject) {
        if diceTimes < 6 {
            resetDiceViews()
            let diceNum = randomDiceRoll()
            updateDiceView(diceNum)
            updateLabelWithRoll(diceNum)
            diceTimes += 1
        }
    }
    
    func updateLabelWithRoll(_ roll: Int) {
        
        let diceScore = String(roll)
        btnReset.isHidden = true
        
        if labelOne.isHidden {
            labelOne.text = diceScore
            labelOne.isHidden = false
        } else if labelTwo.isHidden {
            labelTwo.text = diceScore
            labelTwo.isHidden = false
        } else if labelThree.isHidden {
            labelThree.text = diceScore
            labelThree.isHidden = false
        }
        else if labelFour.isHidden {
            labelFour.text = diceScore
            labelFour.isHidden = false
        }
        else if labelFive.isHidden {
            labelFive.text = diceScore
            labelFive.isHidden = false
        }
        else if labelSix.isHidden {
            labelSix.text = diceScore
            labelSix.isHidden = false
            btnReset.isHidden = false
        }
    }
    
    func updateDiceView(_ diceNum:Int) {
        switch diceNum {
        case 1:
            view4.isHidden = false
        case 2:
            view2.isHidden = false
            view6.isHidden = false
        case 3:
            view3.isHidden = false
            view4.isHidden = false
            view5.isHidden = false
        case 4:
            view1.isHidden = false
            view3.isHidden = false
            view5.isHidden = false
            view7.isHidden = false
        case 5:
            view1.isHidden = false
            view3.isHidden = false
            view4.isHidden = false
            view5.isHidden = false
            view7.isHidden = false
        case 6:
            view1.isHidden = false
            view2.isHidden = false
            view3.isHidden = false
            view5.isHidden = false
            view6.isHidden = false
            view7.isHidden = false
        default:
            resetDiceViews()
        }
    }
    
    func resetDiceViews() {
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        view4.isHidden = true
        view5.isHidden = true
        view6.isHidden = true
        view7.isHidden = true
    }
    
    func resetLabelView() {
        labelOne.isHidden = true
        labelTwo.isHidden = true
        labelThree.isHidden = true
        labelFour.isHidden = true
        labelFive.isHidden = true
        labelSix.isHidden = true
    }
    
    // Returns back a random Int (1, 2, 3, 4, 5, or 6)
    func randomDiceRoll() -> Int {
        return Int(arc4random_uniform(6) + 1)
    }

}
