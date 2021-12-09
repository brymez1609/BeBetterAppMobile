//
//  PersonViewController.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import UIKit

class PersonViewController: UIViewController {
   
    

    @IBOutlet weak var vehicleField: UIPickerView!
    @IBOutlet weak var genderField: UISegmentedControl!
    @IBOutlet weak var cityField: UIPickerView!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var professionField: UIPickerView!
    @IBOutlet weak var dobField: UIDatePicker!
    @IBOutlet weak var cedulaField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    weak var viewModel = PersonViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.getCities(handler: { (result) in
            //2
            switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.cityField.reloadAllComponents()
                    }
                case .failure(_):
                    print("error")
                }
        })
        viewModel?.getProfessions(handler: { (result) in
            //1
            switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.professionField.reloadAllComponents()
                    }
                case .failure(_):
                    print("error")
                    
                }
        })
        viewModel?.getVehicles(handler: { (result) in
            //3
            switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.vehicleField.reloadAllComponents()
                    }
                case .failure(_):
                    print("error")
                }
        })
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        professionField.delegate = self
        professionField.dataSource = self
        cityField.delegate = self
        cityField.dataSource = self
        vehicleField.delegate = self
        vehicleField.dataSource = self
    }

}

extension PersonViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return viewModel?.professions.count ?? 0
        case 2:
            return viewModel?.cities.count ?? 0
        case 3:
            return viewModel?.vehicles.count ?? 0
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return viewModel?.professions[row].name.capitalized
        case 2:
            return viewModel?.cities[row].name.capitalized
        case 3:
            return viewModel?.vehicles[row].model.name.capitalized
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
}
