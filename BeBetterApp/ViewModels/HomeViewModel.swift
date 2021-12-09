//
//  HomeViewModel.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation
import SwiftyJSON
class HomeViewModel {
    static let shared = HomeViewModel()
    var person = PersonElement()
    var people: Person = []
    func getPeople(handler: @escaping (Result<String, NSError>) -> Void)  {
        API.getPeople { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                self.people = response as? Person ?? Person()
                print(self.people)
                handler(.success("Load people successfully"))
                
            }
        }
    }
    func deletePersonAt(cedula:Int, handler: @escaping (Result<String, NSError>) -> Void) {
        API.deletePerson(cedula: cedula) { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                handler(.success("people deleted successfully"))
                
            }
        }
    }
}

