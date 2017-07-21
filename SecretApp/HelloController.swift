//
//  HelloController.swift
//  SecretApp
//
//  Created by TPPFIT iCloud on 6/23/17.
//  Copyright © 2017 TPPFIT iCloud. All rights reserved.
//

import UIKit

class HelloController: UIViewController {

    var userDefaults = UserDefaults.standard
    @IBOutlet var imgIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgIcon.layer.cornerRadius = 100
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clickOnButtonStart(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "LockController") as! LockController
        self.present(controller, animated: true, completion: nil)
    }


}
