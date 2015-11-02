//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Alexander Besson on 2015-11-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    @IBOutlet weak var imgThumbnail : UIImageView!
    @IBOutlet weak var lblName : UILabel!
    
    var pokemon : Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        lblName.text = pokemon.name.capitalizedString
        imgThumbnail.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
}
