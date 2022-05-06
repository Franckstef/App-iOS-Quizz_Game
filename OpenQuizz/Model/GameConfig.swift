//
//  Model.swift
//  Miawouf
//
//  Created by Ambroise COLLON on 13/02/2018.
//  Copyright © 2018 OpenClassrooms. All rights reserved.
//

import Foundation

class Name {
    
    static let shared = Name()

    var name: String = "User Default"
    
    private init(){}

}

