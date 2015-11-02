//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Alexander Besson on 2015-11-02.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var pokemon : Pokemon!

    @IBOutlet weak var lblLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblLabel.text = pokemon.name

        // Do any additional setup after loading the view.
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
