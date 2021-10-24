//
//  Base.swift
//  UserDefaultsDemo
//
//  Created by Maxim Mitin on 25.10.21.
//

import Foundation

class Base {
    
    let defaults = UserDefaults.standard
    static let shared = Base()
    
    struct UserAdress: Codable {
        var city: String
        var street: String
        var house: String
        var corp: String?
        var appartment: String
        
        var name: String {
            return "\(city) , \(street), \(house), \(corp ?? " "), \(appartment)"
        }
    }
    
    var adresses: [UserAdress] {
        get{
            if let data = defaults.value(forKey: "adresses") as? Data {
                return try! PropertyListDecoder().decode([UserAdress].self, from: data)
            } else {
                return [UserAdress]()
            }
        }
        set {
            if let data = try?  PropertyListEncoder().encode(newValue) {
                defaults.set(data, forKey: "adresses")
            }
        }
    }
    
    func saveAdress(city: String, street: String, house: String, corp: String?, appartment: String) {
        let adress = UserAdress(city: city, street: street, house: house, corp: corp, appartment: appartment)
        adresses.insert(adress, at: 0)
    }
}
