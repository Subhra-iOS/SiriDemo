//
//  IntentHandler.swift
//  TaskIntent
//
//  Created by Subhra Roy on 12/10/20.
//

import Intents
import CustomIntentKit
import os.log

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        os_log("IntentHandler called!")
        if intent is TaskIntent {
            return TaskIntentHandler()
        }
        fatalError("Unhandled intent type: \(intent)")
    }
    
}
