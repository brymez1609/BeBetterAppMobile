//
//  People.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation

// MARK: - PersonElement
struct PersonElement: Codable {
    let cedula: Int
    let city: City
    let vehicle: Vehicle
    let profession: City
    let firstName, lastName, dob: String
    let phone: Int?
    let gender, address: String

      enum CodingKeys: String, CodingKey {
          case cedula, city, vehicle, profession
          case firstName = "first_name"
          case lastName = "last_name"
          case dob, phone, gender, address
      }
    
    init()  {
        cedula = 0
        firstName = ""
        lastName = ""
        dob = ""
        phone = 0
        gender = ""
        address = ""
        profession = Profession()
        vehicle = Vehicle()
        city = City()
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    
    init()  {
        id = 0
        name = ""
    }
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let id: Int
    let type: String
    let year: Int
    let model: Model
    
    init()  {
        id = 0
        type = ""
        year = 0
        model = Model()
    }
}

typealias Person = [PersonElement]
typealias Profession = City
typealias Model = City
typealias Cities = [City]
typealias Vehicles = [Vehicle]
typealias Professions = [Profession]
