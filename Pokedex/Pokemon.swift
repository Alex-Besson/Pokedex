//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alexander Besson on 2015-11-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    
    var name: String {
        return _name
    }
    var pokedexID: Int {
        return _pokedexID
    }
    
    init (name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
    }
}