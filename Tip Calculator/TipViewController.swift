//
//  ViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 9/20/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let currencySigns = ["$", "€", "¥", "£"]
    let currencyIdentifiers = ["en_US", "es_ES", "zh_Hans_CN", "en_GB"]
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    let defaults = UserDefaults.standard
    let tipPercentages = [0.18, 0.20, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupColor()
        tipLabel.textColor = getContrastColor()
        totalLabel.textColor = getContrastColor()
        tipControl.tintColor = getContrastColor()
        billField.backgroundColor = getColor()
        billField.textColor = getContrastColor()
        billField.tintColor = getContrastColor()
        barButton.tintColor = getContrastColor()
        barButton.setTitleTextAttributes([
            NSForegroundColorAttributeName: getContrastColor(),
            NSFontAttributeName: UIFont(name: "AvenirNext-Regular", size: 18)!
            ], for: UIControlState.normal)
        navigationItem.title = "Tip Calculator"
        
        // Initialize the tip and total amounts using the local currency
        let formatter = getFormatter()
        let zeroAmount = 0.00 as NSNumber
        let tipLabelString = formatter.string(from: zeroAmount)
        let totalLabelString = formatter.string(from: zeroAmount)
        animateTextView(view: tipLabel, text: tipLabelString!)
        animateTextView(view: totalLabel, text: totalLabelString!)
        
        billField.becomeFirstResponder()
        initializeControl()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        billField.text = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFormatter() -> NumberFormatter {
        let currencyIndex = getCurrencyIndex()
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = NSLocale(localeIdentifier: currencyIdentifiers[currencyIndex]) as Locale!
        return formatter
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let percentage = tipControl.selectedSegmentIndex == UISegmentedControlNoSegment ? Double(getPercentage())/100.0 : tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * percentage
        let total = bill + tip
        
        let formatter = getFormatter()
        tipLabel.text = formatter.string(from: tip as NSNumber!)
        totalLabel.text = formatter.string(from: total as NSNumber!)
    }

    @IBAction func saveTipRate(_ sender: AnyObject) {
        
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    func initializeControl(){
        let percentage = getPercentage()
        switch percentage {
        case 18:
            tipControl.selectedSegmentIndex = 0
        case 20:
            tipControl.selectedSegmentIndex = 1
        case 25:
            tipControl.selectedSegmentIndex = 2
        default:
            tipControl.selectedSegmentIndex = UISegmentedControlNoSegment
        }
    }
    
    func animateTextView(view: UILabel, text: String) {
        UIView.animate(withDuration: 0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            view.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                view.text = text
                
                // Fade in
                UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    view.alpha = 1.0
                    }, completion: nil)
        })
    }

}

