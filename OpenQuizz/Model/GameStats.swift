//
//  GameStats.swift
//  Labo 1
//
//  Created by Franck Kristian Richard Stefani (Étudiant) on 2022-05-01.
//  Copyright © 2022 Ahuntsic. All rights reserved.
//

import Foundation

class GameStats {
    
    var game = Game()
    
    var nbParties = 0
    var bestScore = 0
    var newScore = 0
    
    func addPartie () {
        nbParties = nbParties + 1
    }
    
    func addBestScore () {
        if newScore > bestScore {
            bestScore = newScore
        }
    }
    
}
