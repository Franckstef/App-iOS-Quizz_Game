//
//  GameStatsViewController.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import UIKit

class GameStatsViewController: UIViewController {
    
    var gameStat = GameStats()

    @IBOutlet weak var LabelTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LabelTextField.text = String(gameStat.nbParties)
    }
    


}
