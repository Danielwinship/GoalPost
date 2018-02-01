//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/31/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController,UITextFieldDelegate {
    
    
    //Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description:String, type:GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalButton.bindToKeyboard()
        pointsTextField.delegate = self
        
    }

   
    
    @IBAction func createGoalButtonWasPressed(_ sender: Any) {
    }
    
    
    
    
 

}
