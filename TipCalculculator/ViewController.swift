//
//  ViewController.swift
//  TipCalculculator
//
//  Created by Ajay Gupta on 3/8/15.
//  Copyright (c) 2015 Lennox International. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTaxField: UITextField!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var taxPctLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    
    let tipCalculator = TipCalculatorModel(total: 33.25, taxPct: 0.06)

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTapped(sender: AnyObject)
    {
        tipCalculator.total = (totalTaxField.text as NSString).doubleValue
        
        let possibleTips = tipCalculator.returnPossibleTips()
        
        var results = ""
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentChanged(sender: AnyObject)
    {
        tipCalculator.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func viewTapped(sender: AnyObject)
    {
        totalTaxField.resignFirstResponder()
    }
    
    func refreshUI() {
        totalTaxField.text = String(format: "%0.2f", tipCalculator.total)
        taxPctSlider.value = Float(tipCalculator.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage(\(Int(tipCalculator.taxPct*100))%"
        resultsTextView.text = " "
    }
}

