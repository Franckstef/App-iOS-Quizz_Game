//
//  GameStats.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameStats {
   
    
    var nbParties = 0
    var bestScore = 0
    var tabScore: [Int] = []
    var tabName: [String] = []
    var bouh = [Int:String]()
    var combined: [Any] = []
    
    func addPartie () {
        nbParties = nbParties + 1
    }

    func remplirTabScore (score: Int) {
        tabScore.append(score)
      
    }
    
    func remplirTabNom(name: String) {
        tabName.append(name)
    }
    
    func bla() {
        zip(tabScore, tabName).sorted(by: {$0.0 < $1.0})
    }

}
