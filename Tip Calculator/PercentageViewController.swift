//
//  PercentageViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/9/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class PercentageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var introLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        // Set up correct appearance
        self.setupColor()
        textField.backgroundColor = getColor()
        textField.textColor = getContrastColor()
        textField.tintColor = getContrastColor()
        introLabel.textColor = getContrastColor()
        exitButton.backgroundColor = getContrastColor()
        exitButton.imageView?.tintColor = getColor()
        exitButton.layer.cornerRadius = exitButton.frame.width / 2.0
        exitButton.clipsToBounds = true
        
        // Set up functionality
        textField.becomeFirstResponder()
        textField.placeholder = String(getPercentage())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
    
    @IBAction func textFieldDidChange(_ sender: AnyObject) {
        let numberString = textField.text!
        if numberString.isEmpty==false && 10 <= Int(numberString)! && Int(numberString)! <= 99 {
            view.endEditing(true)
            savePercentage(percentage: Int(numberString)!)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
