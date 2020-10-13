//
//  ViewController.swift
//  SiriIntentDemo
//
//  Created by Subhra Roy on 12/10/20.
//

import UIKit
import os.log
import CustomIntentKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func didOpen(_ sender: Any) {
        self.navigateToTaskView(nil)
    }
    
    private func navigateToTaskView(_ activity: NSUserActivity?){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc: TaskViewController = storyBoard.instantiateViewController(identifier: "TaskViewControllerID") as? TaskViewController{
            vc.setUser(activity: activity)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    override func restoreUserActivityState(_ activity: NSUserActivity) {
        os_log(#function)
        super.restoreUserActivityState(activity)
        
        if activity.activityType == NSUserActivity.taskActivityType {
            self.navigateToTaskView(activity)
        }else if activity.activityType == NSStringFromClass(TaskIntent.self) {
            self.navigateToTaskView(activity)
        }
    }
    
}

