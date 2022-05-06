//
//  GameStatsViewController.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import UIKit

class GameStatsViewController: UIViewController {
    
    let partie = UserDefaults().string(forKey: "nbParties")
    let bestScore = UserDefaults().string(forKey: "bestScore")
    let topScore = UserDefaults().array(forKey: "topScore") as? [Int] ?? [Int]()
    let topName = UserDefaults().array(forKey: "topName") as? [String] ?? [String]()
    let name = UserDefaults().string(forKey: "Name")
    
    @IBOutlet weak var LabelTextField: UILabel!
    
    @IBOutlet weak var LabelTextField2: UILabel!
    
    @IBOutlet weak var LabelTextField3: UILabel!
    
    @IBOutlet weak var LabelTextField4: UILabel!
    
    @IBOutlet weak var Stackview: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelTextField.layer.cornerRadius = 20
        LabelTextField.clipsToBounds = true
        LabelTextField.text = "Nombre de partie: \n\n" + partie!
        
        LabelTextField2.layer.cornerRadius = 20
        LabelTextField2.clipsToBounds = true
        LabelTextField2.text = "Meilleur score: \n\n" + String(name!) + " " + bestScore! + "/10"
        
        Stackview.layer.cornerRadius = 20
        Stackview.clipsToBounds = true
        
            for score in topName {
                LabelTextField4.text! +=  String(score) + "\n"
                
            }
        
            for score in topScore {
                LabelTextField3.text! +=  String(score) + "/10\n"
            }
        
    }
    
}
