//
//  UIViewControllerExt.swift
//  GoalPost
//
//  Created by Daniel Winship on 1/31/18.
//  Copyright © 2018 Daniel Winship. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = kCATransitionPush
        transistion.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transistion, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false, completion: nil)
    }
    
    func presentSecondayDetail(_ viewControllerToPresent:UIViewController) {
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = kCATransitionPush
        transistion.subtype = kCATransitionFromRight
        
        guard let presentedViewController = presentedViewController else {return}
        presentedViewController.dismiss(animated: false) {
            self.view.window?.layer.add(transistion, forKey: kCATransition)
            self.present(viewControllerToPresent, animated: false, completion: nil)
        }
    }
    
    func dismissDetail() {
        let transistion = CATransition()
        transistion.duration = 0.3
        transistion.type = kCATransitionPush
        transistion.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transistion, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    
    }
    
    
}
