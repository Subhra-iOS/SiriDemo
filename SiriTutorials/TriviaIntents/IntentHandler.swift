//
//  IntentHandler.swift
//  TriviaIntents
//
//  Created by Subhra Roy on 09/10/20.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
      
        guard intent is GetRandomTriviaIntent else {
            fatalError("Unhandled intent")
        }
        
        return GetTriviaIntentHandler()
    }
    
}

class GetTriviaIntentHandler: NSObject, GetRandomTriviaIntentHandling{
    
    func confirm(intent: GetRandomTriviaIntent, completion: @escaping (GetRandomTriviaIntentResponse) -> Void) {
        completion(GetRandomTriviaIntentResponse(code: .ready, userActivity: nil))
    }
    
    func handle(intent: GetRandomTriviaIntent, completion: @escaping (GetRandomTriviaIntentResponse) -> Void) {
        NetworkHandler.getTrivia { (trivia) in
            completion(.success(trivia: trivia))
        }
    }
   
}
