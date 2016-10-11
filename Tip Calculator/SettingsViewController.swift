//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by tingting_gao on 9/20/16.
//  Copyright © 2016 tingting_gao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var menuItemNames = ["Percentage", "Currency", "Theme", "Unknown"]
    var menuItemIcons = ["percentage", "currency", "theme", "unknown"]
    // Only animate in the first load
    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
        self.setupColor()
        self.tableView.backgroundColor = getColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        return menuItemNames.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height/4.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! MenuTableViewCell
        cell.label.text = menuItemNames[indexPath.row]
        cell.iconView?.image = UIImage(named: menuItemIcons[indexPath.row])
        cell.backgroundColor = getColor()
        cell.label.textColor = getContrastColor()
        cell.iconView.tintColor = getContrastColor()
        return cell 
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0: self.performSegue(withIdentifier: "pickPercentage", sender: indexPath)
        case 1: self.performSegue(withIdentifier: "pickCurrency", sender: indexPath)
        case 2: self.performSegue(withIdentifier: "pickColor", sender: indexPath)
        default: print(indexPath.row)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickColor" {
            
        }
    }
    // Tableview Animation: https://www.appcoda.com/view-animation-in-swift/
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [.curveEaseOut], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
            
            index += 1
        }
    }

    @IBAction func close(segue:UIStoryboardSegue) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
