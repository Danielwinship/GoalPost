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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func shortTermButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func longTermButtonWasPressed(_ sender: Any) {
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
    }
    
    
    
    
    
    
}
