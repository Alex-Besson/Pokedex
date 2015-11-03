//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alexander Besson on 2015-11-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _baseAttack: String!
    private var _nextEvolutionText: String!
    private var _pokemonURL: String!
    
    var name: String {
        return _name
    }
    var pokedexID: Int {
        return _pokedexID
    }
    
    init (name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        
        _pokemonURL = "\(BASE_URL)\(URL_POKEMON)\(self._pokedexID)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        let url = NSURL(string: _pokemonURL)
//        Alamofire.request(.GET, url!).responseJSON { response in
//            let result = response.result
//            print(result.value)
//            print(response.result)
        
        Alamofire.request(.GET, url!).responseJSON { (request: NSURLRequest?, response: NSHTTPURLResponse?, result: Result<AnyObject>) -> Void in
        
            print(result.value?.debugDescription)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._baseAttack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                    print(types.debugDescription)
                    
                    if let name = types[0]["name"] {
                        self._type = name
                    }
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count; x++ {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalizedString)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                print(self._type)
                
                print(self._defense)
                print(self._baseAttack)
                print(self._height)
                print(self._weight)
            }
        }
    }
}