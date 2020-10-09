//
//  ViewController.swift
//  SiriTutorials
//
//  Created by Subhra Roy on 09/10/20.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func didTapTrivia(_ sender: Any) {
        
        NetworkHandler.getTrivia { [weak self]  message  in
            
            guard let weakSelf = self  else { return }
            DispatchQueue.main.async {
                let alert: UIAlertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
                let action: UIAlertAction = UIAlertAction(title: "OK", style: .destructive) { _  in
                    alert.dismiss(animated: true) {
                        
                    }
                }
                alert.addAction(action)
                weakSelf.present(alert, animated: true) {
                    
                }
                
                INInteraction(intent: GetRandomTriviaIntent(), response: nil).donate { (error) in
                    print("\(String(describing: error?.localizedDescription))")
                }
            }
        }
        
    }
    
}

