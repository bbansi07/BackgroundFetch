//
//  ViewController.swift
//  BackgroundFetch
//
//  Created by bansi on 16/06/17.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblBackgroundStatus : UILabel!
    @IBOutlet var lblSuspendStatus : UILabel!
    @IBOutlet var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateValues), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(clearValues), name: NSNotification.Name.UIApplicationDidFinishLaunching, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateValues()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateValues(){
        let defaults = UserDefaults.standard
        let backgroundTime = defaults.object(forKey: "background") as? String
        let suspendTime = defaults.object(forKey: "suspend") as? String
        
        lblBackgroundStatus.text! = backgroundTime ?? "No background fetch"
        lblSuspendStatus.text! = suspendTime ?? "Never suspended"
        
        lblBackgroundStatus .sizeToFit()
        lblSuspendStatus.sizeToFit()
    }
    
    func clearValues(){
        let defaults = UserDefaults.standard
        
        defaults.set("No background fetch", forKey: "background")
        defaults.set("Never suspended", forKey: "suspend")
        defaults.synchronize()
    }

}

