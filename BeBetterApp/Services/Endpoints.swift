//
//  Endpoints.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation
struct Endpoints {
    static let domain = "http://192.168.0.17:8000"
    static let peopleUrl = Endpoints.domain + "/people/"
    static let cityUrl = Endpoints.domain + "/city/"
    static let vehicleUrl = Endpoints.domain + "/vehicle/"
    static let professionUrl = Endpoints.domain + "/profession/"
    static func getPersonUrl(cedula:String) -> String {
        let url = Endpoints.peopleUrl+cedula
        return url
    }
}
