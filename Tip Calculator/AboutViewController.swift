//
//  AboutViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/11/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupColor()
        textView.textColor = getContrastColor()
        textView.backgroundColor = getColor()
        self.automaticallyAdjustsScrollViewInsets = false
        animateTextView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // https://www.andrewcbancroft.com/2014/07/27/fade-in-out-animations-as-class-extensions-with-swift/
    func animateTextView() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.textView.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                
                //Once the label is completely invisible, set the text and fade it back in
                self.textView.text = "This simple, handy application allows convenient calculation of tips. \n \n You could customize the look of the interface with 9 different colors, quickly set the default tip percentage and select the display currency type. \n \n Thanks for reviewing it!"
                
                // Fade in
                UIView.animate(withDuration: 1.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                    self.textView.alpha = 1.0
                    }, completion: nil)
        })
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
