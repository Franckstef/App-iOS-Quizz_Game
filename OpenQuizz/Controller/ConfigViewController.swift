//
//  ConfigViewController.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import UIKit

class ConfigViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Name.shared.name = UserDefaults().string(forKey: "Name")!
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var LabelTextField: UILabel!
    
    @IBAction func unwindToConfig(segue:UIStoryboardSegue) { }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {

       nameTextField.resignFirstResponder()
    }
    
    @IBAction func validate(_ sender: Any) {
        LabelTextField.text = nameTextField.text
        Name.shared.name = nameTextField.text ?? ""
    }
    
}

extension ConfigViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          textField.resignFirstResponder()
          return true
       }
}
