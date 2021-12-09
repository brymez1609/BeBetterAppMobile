//
//  PersonViewModel.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation
import SwiftyJSON
class PersonViewModel {
    static let shared = PersonViewModel()
    var vehicles: Vehicles = []
    var cities: Cities = []
    var professions: Professions = []
    func savePerson(person: PersonElement, handler: @escaping (Result<String, NSError>) -> Void)  {
        API.savePerson(person:person) { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                handler(.success("Save people successfully"))
                
            }
        }
    }
    
    func getCities(handler: @escaping (Result<String, NSError>) -> Void) {
        API.getCities { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                self.cities = response as? Cities ?? Cities()
                handler(.success("Save people successfully"))
                
            }
        }
    }
    func getVehicles(handler: @escaping (Result<String, NSError>) -> Void) {
        API.getVehicles { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                self.vehicles = response as? Vehicles ?? Vehicles()
                handler(.success("Save people successfully"))
                
            }
        }
    }
    func getProfessions(handler: @escaping (Result<String, NSError>) -> Void) {
        API.getProfessions { response, error, statusCode in
            if error != nil {
                print(error)
                handler(.failure(error ?? NSError()))
            }
            else {
                self.professions = response as? Professions ?? Professions()
                handler(.success("Save people successfully"))
                
            }
        }
    }
}
