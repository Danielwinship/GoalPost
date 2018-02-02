//
//  GoalVC.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/29/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var undoDeleteView: UIView!
    
    var goals: [Goal] = []
    var undoDeleteGoal: [Goal] = []
    var undoDeleteGoalIndexPath: IndexPath = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       fetchCoreDataObjects()
        tableView.reloadData()
        
    }
    
  
    
    func fetchCoreDataObjects() {
        self.fetch { (success) in
            if success {
                if goals.count >= 1 {
                    tableView.isHidden = false
                    
                    
                } else {
                    tableView.isHidden = true
                    undoDeleteView.isHidden = true
                }
          
          }
        }
    }

    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else {return}
        presentDetail(createGoalVC)
    }
    

    @IBAction func undoDeleteButtonWasPressed(_ sender: Any) {
        if undoDeleteGoal.count > 0 {
        undoDeleteGoal() { (success) in
            if success {
                fetchCoreDataObjects()
                tableView.reloadData()
            }
        }
    }
}

}

extension GoalsVC: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else {return UITableViewCell()}
        let goal = goals[indexPath.row]
        cell.configureCell(goal: goal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreDataObjects()
            self.undoDeleteView.isHidden = false
            self.undoDeleteGoalIndexPath = indexPath
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 1, green: 0.7190129285, blue: 0.2155339286, alpha: 1)
        
        
        return [deleteAction, addAction]
    }
    
}

extension GoalsVC {
    
    func setProgress( atIndexPath indexPath: IndexPath){
         guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let chosenGoal = goals[indexPath.row]
        
        if chosenGoal.goalProgress < chosenGoal.goalCompletionValue {
            chosenGoal.goalProgress = chosenGoal.goalProgress + 1
        }else {
            return
        }
        
        do {
            try managedContext.save()
            print("Successfully set progress")
        }catch {
            debugPrint("Could not set progress \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do{
            goals = try  managedContext.fetch(fetchRequest)
            print("Successfully fetched data")
            completion(true)
            
        }catch {
            debugPrint("Could not fetch \(error.localizedDescription)")
            completion(false)
        }
       
    }
    
    func removeGoal(atIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        self.undoDeleteGoal = [goals[indexPath.row]]
       
        managedContext.delete(goals[indexPath.row])
        
        
        do {
           try managedContext.save()
            print("Successfully removed goal")
           
        }catch {
            debugPrint("Could not remove \(error.localizedDescription)")
        }
    }
    
    
    
    func undoDeleteGoal(completion:( _ finished:Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        let undoGoal = Goal(context: managedContext)
        
        
        undoGoal.goalDescription = undoDeleteGoal[0].goalDescription
        undoGoal.goalType = undoDeleteGoal[0].goalType
        undoGoal.goalCompletionValue = undoDeleteGoal[0].goalCompletionValue
        undoGoal.goalProgress = undoDeleteGoal[0].goalProgress
        
        
        do {
            try managedContext.save()
            print("Successfully saved undo data")
            completion(true)
            undoDeleteGoal.removeAll()
        }catch {
            debugPrint("Could not save undo data \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
}

