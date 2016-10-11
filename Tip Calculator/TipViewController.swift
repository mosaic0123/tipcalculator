//
//  ViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 9/20/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
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
        
        billField.becomeFirstResponder()
        initializeControl()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        print(getPercentage())
        let bill = Double(billField.text!) ?? 0
        let percentage = tipControl.selectedSegmentIndex == UISegmentedControlNoSegment ? Double(getPercentage())/100.0 : tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * percentage
        let total = bill + tip
        print(percentage)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f",total)
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

}

