//  StartViewController.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.

import UIKit

class StartViewController: UIViewController {
    
    var gameStat = GameStats()

    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaults().set(gameStat.nbParties, forKey: "nbParties")
        UserDefaults().set("-", forKey: "bestScore")
        UserDefaults().set("", forKey: "topScore")
        UserDefaults().set("", forKey: "topName")
        UserDefaults().set("", forKey: "Name")
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true)
    }
   
}
