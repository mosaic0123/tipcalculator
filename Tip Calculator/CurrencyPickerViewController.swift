//
//  CurrencyPickerViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/9/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class CurrencyPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupColor()
        pickerView.backgroundColor = getColor()
        checkButton.backgroundColor = getContrastColor()
        checkButton.imageView?.tintColor = getColor()
        checkButton.layer.cornerRadius = checkButton.frame.width / 2.0
        checkButton.clipsToBounds = true
        pickerView.selectRow(getCurrencyIndex(), inComponent: 0, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.Currency.values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.text = Constants.Currency.values[row]
        pickerLabel.font = UIFont(name: "AvenirNext-Medium", size: 24)
        pickerLabel.textColor = getContrastColor()
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.height / 5.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        saveCurrencyIndex(index: row)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
