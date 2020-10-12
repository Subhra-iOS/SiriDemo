//
//  TaskIntentHandler.swift
//  SiriIntentDemo
//
//  Created by Subhra Roy on 12/10/20.
//

import Foundation
import os.log

public class TaskIntentHandler: NSObject, TaskIntentHandling {

    public func confirm(intent: TaskIntent, completion: @escaping (TaskIntentResponse) -> Void) {
        os_log(#function)
        completion(TaskIntentResponse(code: .ready, userActivity: nil))
    }

    public func handle(intent: TaskIntent, completion: @escaping (TaskIntentResponse) -> Void) {
        os_log(#function)
        completion(TaskIntentResponse.success(success: "task"))
    }


}
