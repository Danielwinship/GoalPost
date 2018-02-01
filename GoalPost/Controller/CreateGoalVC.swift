//
//  CreateGoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/31/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.bindToKeyboard()
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()

        
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButton.setSelectedColor()
        longTermButton.setDeselectedColor()
    }
    
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButton.setSelectedColor()
        shortTermButton.setDeselectedColor()
        
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        
    }
    
    
    
    
    
    
}
