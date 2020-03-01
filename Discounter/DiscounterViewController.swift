//
//  ViewController.swift
//  Discounter
//
//  Created by Jeff Low on 2/25/20.
//  Copyright © 2020 Jeff Low. All rights reserved.
//

import UIKit

class DiscounterViewController: UIViewController {
    
    @IBOutlet weak var originalPriceTextField: UITextField!
    @IBOutlet weak var percentTextField: UITextField!

    var priceFormatted = 0.0
    var finalResult = "0.0"
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let price = originalPriceTextField.text!
        let percentage = percentTextField.text!

        if price != "" && percentage != "" {
            let newPercentage = (Double(percentage)! / 100) * Double(price)!
            priceFormatted = Double(price)!
            
            let result = priceFormatted - newPercentage
            finalResult = String(format: "%.2f", result)
        } else {
            let alert = UIAlertController.init(title: "Wow", message: "You clearly didn't type in all the required fields...", preferredStyle: .alert)

            let action2 = UIAlertAction(title: "I feel dumb", style: .cancel) { (action:UIAlertAction) in
                print("You've pressed cancel");
            }
            
            alert.addAction(action2)
            
            self.present(alert, animated: true, completion: nil)
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = finalResult
        }
    }

}

extension UITextField {

    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }

}

