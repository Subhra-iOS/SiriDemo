//
//  ViewController.swift
//  SiriIntentDemo
//
//  Created by Subhra Roy on 12/10/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func didOpen(_ sender: Any) {
        self.navigateToTaskView()
    }
    
    private func navigateToTaskView(){
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let vc: TaskViewController = storyBoard.instantiateViewController(identifier: "TaskViewControllerID") as? TaskViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

