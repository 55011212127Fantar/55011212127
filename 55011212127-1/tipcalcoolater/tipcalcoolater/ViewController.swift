//
//  ViewController.swift
//  tipcalcoolater
//
//  Created by student on 9/12/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    
    @IBOutlet var totalTextField: UITextField!
    
    @IBOutlet var taxPctSlider: UISlider!
    
    @IBOutlet var taxPctLabel: UITextField!

    @IBOutlet var resuDidLode: UITextView!
    
  
   
    let tipCalc = tipcalcoolater(total :3.25,taxPct:0.06)
    func refreshUT(){
        totalTextField.text = String(format : "%0.2f",tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct)*100.0
        taxPctLabel.text = "Tax Percentage(\(Int(taxPctSlider.value))%)"
        resuDidLode.text=""
     
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    refreshUT()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculatetap(sender: AnyObject) {
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        for (tipPct,tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resuDidLode.text = results
    }

    @IBAction func taxPercentageChanged(sender: AnyObject) {
    tipCalc.taxPct == Double(taxPctSlider.value)/100.0
        refreshUT()
    }
    
    
    @IBAction func viewTapped(sender: AnyObject) {
    totalTextField.resignFirstResponder()
    }
    
  
    
    

}

