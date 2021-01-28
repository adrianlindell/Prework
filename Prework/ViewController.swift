//
//  ViewController.swift
//  Prework
//
//  Created by Adrian Lindell on 1/25/21.
//

import UIKit

var tipPercentages = [0.15, 0.18, 0.2]

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var stepperValue: UILabel!
    @IBOutlet weak var numberOfPeople: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the title in the navigation bar
        self.title = "ShareTip"
        numberOfPeople.autorepeat = true
        numberOfPeople.maximumValue = 30
        numberOfPeople.minimumValue = 1
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTip1 = defaults.double(forKey: "tip1")
        let defaultTip2 = defaults.double(forKey: "tip2")
        let defaultTip3 = defaults.double(forKey: "tip3")
        
        tipPercentages = [defaultTip1 == 0 ? 0.15 : (defaultTip1 / 100), defaultTip2 == 0 ? 0.18 : (defaultTip2 / 100), defaultTip3 == 0 ? 0.2 : (defaultTip3 / 100)]
        
        let stringTip1 = String(format: "%.1f", tipPercentages[0] * 100)
        let stringTip2 = String(format: "%.1f", tipPercentages[1] * 100)
        let stringTip3 = String(format: "%.1f", tipPercentages[2] * 100)
        
        tipControl.setTitle(stringTip1 + "%", forSegmentAt: 0)
        tipControl.setTitle(stringTip2 + "%", forSegmentAt: 1)
        tipControl.setTitle(stringTip3 + "%", forSegmentAt: 2)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue.text = Int(sender.value).description
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip * tipPercentage
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        var total = bill + tip
        
        if let numPeople = stepperValue.text {total /= Double(numPeople) ?? 1}
        
        //Update tip amount
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

