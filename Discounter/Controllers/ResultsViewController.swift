//
//  ResultsViewController.swift
//  Discounter
//
//  Created by Jeff Low on 2/29/20.
//  Copyright © 2020 Jeff Low. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultsLabel: UILabel!

    var result = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()

        resultsLabel.text = "$" + result
    }
    
    @IBAction func dismissModal(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    

}
