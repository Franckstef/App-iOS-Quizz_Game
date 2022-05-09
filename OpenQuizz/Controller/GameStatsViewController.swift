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
    var topScore = UserDefaults().array(forKey: "topScore") as? [Int] ?? [Int]()
    let topName = UserDefaults().array(forKey: "topName") as? [String] ?? [String]()
    let name = UserDefaults().string(forKey: "Name")
    
    
    @IBOutlet weak var nbParties: UILabel!
    
    @IBOutlet weak var topScore2: UILabel!
    
    @IBOutlet weak var topCinqNom: UILabel!
    
    @IBOutlet weak var topCinqScore: UILabel!
    
    @IBOutlet weak var Stackview1: UIStackView!
    
    @IBOutlet weak var Stackview2: UIStackView!
    
    @IBOutlet weak var Stackview3: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let combined = zip(topScore, topName).sorted(by: {$0.0 > $1.0})
        let sorted1 = combined.map {$0.0}
        let sorted2 = combined.map {$0.1}
        
        Stackview1.layer.cornerRadius = 20
        Stackview1.clipsToBounds = true
        nbParties.text = partie!
        
        Stackview2.layer.cornerRadius = 20
        Stackview2.clipsToBounds = true
        topScore2.text = String(name!) + " " + bestScore! + "/10"
        
        Stackview3.layer.cornerRadius = 20
        Stackview3.clipsToBounds = true
        
        
        
            for score in sorted1 {
                topCinqScore.text! +=   String(score) + "/10\n"
            }
        
            for score in sorted2 {
                topCinqNom.text! +=  String(score) + "\n"
            }
        
    }
    
}
