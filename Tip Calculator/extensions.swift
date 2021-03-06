//
//  extensions.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/8/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import Foundation
import UIKit

func getColor() -> UIColor {
    let defaults = UserDefaults.standard
    let colorIndex = defaults.object(forKey: "colorIndex")==nil ? 0 : defaults.integer(forKey: "colorIndex")
    return Constants.Colors.values[colorIndex]
}

func getContrastColor() -> UIColor {
    let defaults = UserDefaults.standard
    let colorIndex = defaults.object(forKey: "colorIndex")==nil ? 0 : defaults.integer(forKey: "colorIndex")
    return Constants.contrastColors.values[colorIndex]
}

func getColorName() -> String {
    let defaults = UserDefaults.standard
    let colorIndex = defaults.object(forKey: "colorIndex")==nil ? 0 : defaults.integer(forKey: "colorIndex")
    return Constants.colorNames[colorIndex]
}

func getColorIndex() -> Int {
    let defaults = UserDefaults.standard
    let colorIndex = defaults.object(forKey: "colorIndex")==nil ? 0 : defaults.integer(forKey: "colorIndex")
    return colorIndex
}

func getCurrencyIndex() -> Int {
    let defaults = UserDefaults.standard
    let currencyIndex = defaults.object(forKey: "currencyIndex")==nil ? 0 : defaults.integer(forKey: "currencyIndex")
    return currencyIndex
}

func getPercentage() -> Int {
    let defaults = UserDefaults.standard
    let percentage = defaults.object(forKey: "percentage")==nil ? 15 : defaults.integer(forKey: "percentage")
    return percentage
}

func saveCurrencyIndex(index: Int) {
    let defaults = UserDefaults.standard
    defaults.set(index, forKey: "currencyIndex")
}

func savePercentage(percentage: Int) {
    let defaults = UserDefaults.standard
    defaults.set(percentage, forKey: "percentage")
}

struct Constants {
    static let colorNames = ["White", "Yellow", "Orange", "Red", "Pink", "Emerald", "Blue", "Amethyst", "Black"]

    struct Colors {
        static let values =
            [   UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1),
                UIColor(red: 241/255.0, green: 196/255.0, blue: 15/255.0, alpha: 1),
                UIColor(red: 230/255.0, green: 126/255.0, blue: 34/255.0, alpha: 1),
                UIColor(red: 231/255.0, green: 76/255.0, blue: 60/255.0, alpha: 1),
                UIColor(red: 255/255.0, green: 153/255.0, blue: 204/255.0, alpha: 1),
                UIColor(red: 46/255.0, green: 204/255.0, blue: 113/255.0, alpha: 1),
                UIColor(red: 52/255.0, green: 152/255.0, blue: 219/255.0, alpha: 1),
                UIColor(red: 155/255.0, green: 89/255.0, blue: 182/255.0, alpha: 1),
                UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1)
            ]
    }

    struct contrastColors {
        static let values =
            [   UIColor(red: 15/255.0, green: 15/255.0, blue: 15/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1),
                UIColor(red: 236/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1)
            ]
    }
    
    struct Currency {
        static let values = ["USD", "EUR", "CNY", "GBP"]
    }
}

extension UIViewController {
    
    func setupColor(){
        self.view.backgroundColor = getColor()
    }
    
//    func setupButton(button: UIButton){
//        button.layer.cornerRadius = button.frame.width / 2.0
//        button.clipsToBounds = true
//        button.backgroundColor = getContrastColor()
//        button.imageView?.tintColor = getColor()
//    }
    
}


extension UIView {
    
    // Shake Animation: http://stackoverflow.com/questions/27987048/shake-animation-for-uitextfield-uiview-in-swift
//    func shake() {
//        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//        animation.duration = 0.8
//        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
//        layer.add(animation, forKey: "shake")
//    }
    
}
