//
//  ColorPickerViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 10/4/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController, UICollectionViewDataSource,
UICollectionViewDelegate {
    
    @IBOutlet var collectionView:UICollectionView!

    @IBOutlet weak var colorLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupColor()
        self.collectionView.backgroundColor = getColor()
        self.colorLabel.textColor = getContrastColor()
        self.colorLabel.text = getColorName()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clear
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.colorNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ColorCollectionViewCell
        cell.button.frame = CGRect(x: CGFloat(cell.frame.size.width/5.0), y: CGFloat(cell.frame.size.height/5.0), width: CGFloat(3*cell.frame.size.width/5.0), height: CGFloat(3*cell.frame.size.height/5.0))
        cell.button.layer.cornerRadius = cell.button.frame.width / 2.0
        cell.button.clipsToBounds = true
        cell.backgroundColor = getColor()
        
        // Add tag for buttonTouched method
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: "buttonTouched:", for: UIControlEvents.touchUpInside)
        cell.button.backgroundColor = Constants.Colors.values[indexPath.row]
        
        // Set border for selected cell
        let index = getColorIndex()
        if indexPath.row == index {
            cell.button.layer.borderWidth = 2
            cell.button.layer.borderColor = getContrastColor().cgColor
        }
        return cell
    }
    
    @IBAction func buttonTouched(_ sender: UIButton) {
        saveColorIndex(index: sender.tag)
    }
    
    func saveColorIndex(index: Int){
        let defaults = UserDefaults.standard
        let previousIndex = defaults.integer(forKey: "colorIndex")
        let previousCell = collectionView.cellForItem(at: IndexPath(row: previousIndex, section: 0)) as! ColorCollectionViewCell
        previousCell.button.layer.borderWidth = 0
        
        defaults.set(index, forKey: "colorIndex")
        self.colorLabel.text = Constants.colorNames[index]
        self.view.backgroundColor = Constants.Colors.values[index]
        self.colorLabel.textColor = Constants.contrastColors.values[index]
        
        // Set border of selected cell
        collectionView.reloadData()
        collectionView.backgroundColor = getColor()
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
