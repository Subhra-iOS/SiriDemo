//
//  IntentViewController.swift
//  TaskIntentUI
//
//  Created by Subhra Roy on 12/10/20.
//

import IntentsUI
import CustomIntentKit
import os.log

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    
    @IBOutlet weak var taskButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
        
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        
        os_log(#function)
        
        if interaction.intentHandlingStatus == .success {
            os_log("intentHandlingStatus == .success")
            if let _ = interaction.intentResponse as? TaskIntentResponse {
                os_log("inside TaskIntentResponse")
                completion(true, parameters, CGSize(width: desiredSize.width, height: taskButton.frame.height))
                return
            }
        }
        
        if interaction.intentHandlingStatus == .ready {
    
        }
        
        completion(false, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
    
    @IBAction func didTapOnOpenTask(_ sender: Any) {
    }
    
}
