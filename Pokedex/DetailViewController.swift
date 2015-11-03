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
        imgMain.image = UIImage(named: "\(pokemon.pokedexID)")
        
        pokemon.downloadPokemonDetails { () -> () in
            // will be called when download is done
        }
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
