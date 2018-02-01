//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/31/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit
import CoreData

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
    
    @IBAction func backButtonWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    
    
    
    func save(completion:( _ finished:Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
        }catch {
            debugPrint("Could not save \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
 

}
