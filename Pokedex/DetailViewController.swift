//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Alexander Besson on 2015-11-02.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDefense: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblWeight: UILabel!
    @IBOutlet weak var lblPokedexID: UILabel!
    @IBOutlet weak var lblBaseAttack: UILabel!
    
    @IBOutlet weak var lblNextEvolution: UILabel!
    
    @IBOutlet weak var imgFirstEvolution: UIImageView!
    @IBOutlet weak var imgSecondEvolution: UIImageView!
    
    var pokemon : Pokemon!
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = pokemon.name
        
        let img = UIImage(named: "\(pokemon.pokedexID)")
        imgMain.image = img
        imgFirstEvolution.image = img
        
        pokemon.downloadPokemonDetails { () -> () in
            // will be called when download is done
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        lblDescription.text = pokemon.description
        lblType.text = pokemon.type
        lblDefense.text = pokemon.defense
        lblHeight.text = pokemon.height
        lblWeight.text = pokemon.weight
        lblPokedexID.text = "\(pokemon.pokedexID)"
        lblBaseAttack.text = pokemon.baseAttack
        
        
        if pokemon.nextEvolutionID == "" {
            lblNextEvolution.text = "No Evolutions"
            imgSecondEvolution.hidden = true
        } else {
            imgSecondEvolution.hidden = false
            imgSecondEvolution.image = UIImage(named: pokemon.nextEvolutionID)
            var str = "Next Evolution: \(pokemon.nextEvolutionText)"
            
            if pokemon.nextEvolutionText != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
        }
        
//        imgNextEvolution.image = UIImage(named: pokemon.name)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
