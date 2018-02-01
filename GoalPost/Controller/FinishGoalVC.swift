//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/31/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var createGoalButton: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
createGoalButton.bindToKeyboard()
        
    }

   
    
    @IBAction func createGoalButtonWasPressed(_ sender: Any) {
    }
    
    
    
    
 

}
