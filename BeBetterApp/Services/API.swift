//
//  API.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation
import Simple_Networking

public typealias RequestResponseJSON = (
    _ response: Codable?,
    _ error: NSError?,
    _ statusCode: Int?) -> Void

class API {
    static func getPeople(handler: @escaping RequestResponseJSON) {
        SN.get(endpoint: Endpoints.peopleUrl) { (response: SNResultWithEntity<Person, ErrorResponse>) in
            switch response {
            case .success(let people):
                handler(people, nil, 200)
                return
            case .error(let error):
                handler(nil, nil, 400)
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
    static func getPerson(cedula:Int, handler: @escaping RequestResponseJSON) {
        SN.get(endpoint: Endpoints.getPersonUrl(cedula:  String(cedula))) { (response: SNResultWithEntity<[PersonElement], ErrorResponse>) in
            switch response {
            case .success(let posts):
            
                return
            case .error(let error):
               
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
    
    static func deletePerson(cedula:Int, handler: @escaping RequestResponseJSON) {
        SN.delete(endpoint: Endpoints.getPersonUrl(cedula:  String(cedula))) { (response: SNResultWithEntity<[PersonElement], ErrorResponse>) in
            switch response {
            case .success(let posts):
                handler(nil, nil, 200)
                return
            case .error(let error):
                handler(nil, nil, 400)
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
    
    static func savePerson(person: PersonElement, handler: @escaping RequestResponseJSON) {
        SN.post(endpoint: Endpoints.peopleUrl, model: person) { (response: SNResultWithEntity<PersonElement, ErrorResponse>) in
            switch response {
            case .success( _):
               
                return
            case .error(let error):
              
                return
            case .errorResult(let entity):
              
                return
            }
        }
    }
    
    static func getCities(handler: @escaping RequestResponseJSON) {
        SN.get(endpoint: Endpoints.cityUrl) { (response: SNResultWithEntity<Cities, ErrorResponse>) in
            switch response {
            case .success(let cities):
                handler(cities, nil, 200)
                return
            case .error(let error):
                handler(nil, nil, 400)
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
    
    static func getVehicles(handler: @escaping RequestResponseJSON) {
        SN.get(endpoint: Endpoints.vehicleUrl) { (response: SNResultWithEntity<Vehicles, ErrorResponse>) in
            switch response {
            case .success(let vehicles):
                handler(vehicles, nil, 200)
                return
            case .error(let error):
                handler(nil, nil, 400)
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
    
    
    static func getProfessions(handler: @escaping RequestResponseJSON) {
        SN.get(endpoint: Endpoints.professionUrl) { (response: SNResultWithEntity<Professions, ErrorResponse>) in
            switch response {
            case .success(let professions):
                handler(professions, nil, 200)
                return
            case .error(let error):
                handler(nil, nil, 400)
                return
            case .errorResult(let entity):
                
                return
            }
        }
    }
}
