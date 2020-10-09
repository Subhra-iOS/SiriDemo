//
//  NetworkHandler.swift
//  SiriTutorials
//
//  Created by Subhra Roy on 09/10/20.
//

import Alamofire

struct NetworkHandler {
   static func getTrivia(handler: @escaping (String) -> Void) -> Void{
        Alamofire.AF.request("http://numbersapi.com/random/trivia").responseString { (response) in
            do{
                let triviaResponse = try response.result.get()
                handler(triviaResponse)
                
            }catch{
                handler("Error in response")
            }
        }
    }
}
