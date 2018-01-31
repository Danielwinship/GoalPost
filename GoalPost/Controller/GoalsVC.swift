//
//  GoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/29/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }

    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        
        presentDetail(createGoalVC)
        
    }
    


}

extension GoalsVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        cell.configureCell(description: "eat salad more", type: .shortTerm, goalProgressAmount: 2)
        return cell
    }
}

