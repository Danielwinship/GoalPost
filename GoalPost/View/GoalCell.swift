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
    @IBOutlet weak var goalDescriptionLabel: UILabel!
    @IBOutlet weak var goalTypeLabel: UILabel!
    @IBOutlet weak var goalProgressLabel: UILabel!
    
    
    func configureCell(description: String, type: GoalType, goalProgressAmount: Int){
        self.goalDescriptionLabel.text = description
        self.goalTypeLabel.text = type.rawValue
        goalProgressLabel.text = String(describing: goalProgressAmount)
    }
    
    
    
}
