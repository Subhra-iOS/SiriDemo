//
//  NSUserActivity+IntentData.swift
//  SiriIntentDemo
//
//  Created by Subhra Roy on 12/10/20.
//

import Foundation
import Intents

extension NSUserActivity {
    
    public static let  taskActivityType = "com.ARCDemo.CustomIntentKit.openTask"
    
    public static var viewTaskActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: NSUserActivity.taskActivityType)
        
        userActivity.title = "Current Task"
        userActivity.persistentIdentifier = NSUserActivityPersistentIdentifier(NSUserActivity.taskActivityType)
        userActivity.isEligibleForPrediction = true
        userActivity.suggestedInvocationPhrase = "View Task"
        
        return userActivity
    }
}
