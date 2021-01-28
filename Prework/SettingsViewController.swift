//
//  SettingsViewController.swift
//  Prework
//
//  Created by Adrian Lindell on 1/27/21.
//

import UIKit

class SettingsViewController: UIViewController {
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"

        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        defaults.synchronize()
    }
    
    @IBOutlet weak var tip1TextField: UITextField!
    @IBOutlet weak var tip2TextField: UITextField!
    @IBOutlet weak var tip3TextField: UITextField!
    
    @IBAction func setTip1(_ sender: Any) {
        let tip = Double(tip1TextField.text!) ?? 0
        defaults.set(tip, forKey: "tip1")
    }
    
    @IBAction func setTip2(_ sender: Any) {
        let tip = Double(tip2TextField.text!) ?? 0
        defaults.set(tip, forKey: "tip2")
    }
    
    @IBAction func setTip3(_ sender: Any) {
        let tip = Double(tip3TextField.text!) ?? 0
        defaults.set(tip, forKey: "tip3")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
