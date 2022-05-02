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
    
    @IBOutlet weak var LabelTextField: UILabel!
    
    @IBOutlet weak var LabelTextField2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        LabelTextField.text = "Nombre de partie: " + partie!
        
        LabelTextField2.text = "Meilleur score: " + bestScore! + "/10"
    }
    


}
