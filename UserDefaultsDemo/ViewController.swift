//
//  ViewController.swift
//  UserDefaultsDemo
//
//  Created by Maxim Mitin on 25.10.21.
//

import UIKit

struct KeysDefaults {
    static let keyCity = "city"
    static let keyStreet = "street"
    static let keyHouse = "house"
    static let keyCorp = "corp"
    static let keyAppartment = "appartment"
}

class ViewController: UIViewController {
    
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var streetTxtField: UITextField!
    @IBOutlet weak var houseTxtField: UITextField!
    @IBOutlet weak var corpTxtField: UITextField!
    @IBOutlet weak var appartmentTxtField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTxtField.text = defaults.string(forKey: KeysDefaults.keyCity)
        streetTxtField.text = defaults.string(forKey: KeysDefaults.keyStreet)
        houseTxtField.text = defaults.string(forKey: KeysDefaults.keyHouse)
        corpTxtField.text = defaults.string(forKey: KeysDefaults.keyCorp)
        appartmentTxtField.text = defaults.string(forKey: KeysDefaults.keyAppartment)
        
//        print("City - \(cityTxtField.text) ,street \(streetTxtField.text), house - \(houseTxtField.text), corp - \(corpTxtField.text), appart - \(appartmentTxtField.text)")
        
    }

    @IBAction func saveBtn(_ sender: Any) {
        
        let city = cityTxtField.text ?? ""
        let street = streetTxtField.text ?? ""
        let house = houseTxtField.text ?? ""
        let corp = corpTxtField.text ?? ""
        let appartment = appartmentTxtField.text ?? ""
        
        if !city.isEmpty && !street.isEmpty && !house.isEmpty && !corp.isEmpty && !appartment.isEmpty {
            
            Base.shared.saveAdress(city: city, street: street, house: house, corp: corp, appartment: appartment)
            
            self.navigationController?.popViewController(animated: true)
            
            print("Saved data: City - \(city) , street - \(street),house - \(house),corp - \(corp),appart - \(appartment)")
        }
    }
    
}

