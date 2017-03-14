//
//  SettingsViewController.swift
//  tipper
//
//  Created by Li, Zhifan on 3/13/17.
//  Copyright © 2017 Li, Zhifan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tipSettings: UISegmentedControl!
    @IBOutlet weak var tipSettingsLabel: UILabel!
    @IBOutlet weak var tipSettingsPrompt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let defaultIndex = defaults.integer(forKey: "tipDefault")
        tipSettings.selectedSegmentIndex = defaultIndex
        
        // Optionally initialize the property to a desired starting value
        self.tipSettingsLabel.alpha = 0
        self.tipSettingsPrompt.alpha = 1
        UIView.animate(withDuration: 2, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipSettingsLabel.alpha = 1
            self.tipSettingsPrompt.alpha = 0
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
    @IBAction func onTapSettings(_ sender: AnyObject) {
        let tipPercentages = [0, 1, 2]
        
        let tipDefault = tipPercentages[tipSettings.selectedSegmentIndex]
        
        let defaults = UserDefaults.standard
        defaults.set(tipDefault, forKey: "tipDefault")
        defaults.synchronize()
    }

}
