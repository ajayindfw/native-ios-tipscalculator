//
//  TipCalculatorModel.swift
//  TipCalculculator
//
//  Created by Ajay Gupta on 3/8/15.
//  Copyright (c) 2015 Lennox International. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subTotal: Double {
        get {
            return total/(taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double)
    {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTaxPct(tipPct: Double) -> (tipAmount: Double, total: Double)
    {
        let tipAmount = subTotal * tipPct
        let finalTotal = subTotal + tipAmount
        return (tipAmount, finalTotal)
    }
    
    func returnPossibleTips() -> [Int: (tipAmount: Double, total: Double)] {
        let possibleTipsInferred = [0.15, 0.18, 0.2]
        
        var returnValue = Dictionary<Int, (tipAmount: Double, total:Double)>()
        for possibleTip in possibleTipsInferred {
            returnValue[Int(possibleTip*100)] = calcTipWithTaxPct(possibleTip)
        }
        
        return returnValue
    }
}
