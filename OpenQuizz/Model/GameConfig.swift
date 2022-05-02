//
//  Model.swift
//  Miawouf
//
//  Created by Ambroise COLLON on 13/02/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

struct Name {

    var name: String?
    
    enum Status {
        case accepted
        case rejected(String)
    }

    var status: Status {
        guard let name = name, name.isEmpty == false else {
            return .rejected("Vous n'avez pas indiqué votre nom !")
        }
        
        return .accepted
    }
}

