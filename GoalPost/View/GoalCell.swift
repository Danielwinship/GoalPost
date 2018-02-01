//
//  GoalCell.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/29/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

  //Outlets
    
    @IBOutlet weak var completionView: UIView!
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    
    func configureCell(goal: Goal){
        self.goalDescriptionLabel.text = goal.goalDescription
        self.goalTypeLabel.text = goal.goalType
        goalProgressLabel.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            self.completionView.isHidden = false
        }else {
            self.completionView.isHidden = true
        }
        
    }
    
    
    
}
