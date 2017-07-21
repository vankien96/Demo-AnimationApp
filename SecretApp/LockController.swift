//
//  LockController.swift
//  SecretApp
//
//  Created by TPPFIT iCloud on 6/22/17.
//  Copyright © 2017 TPPFIT iCloud. All rights reserved.
//

import UIKit
import AudioToolbox

class LockController: UIViewController,UIAlertViewDelegate{

    
    @IBOutlet var btnBackspace: UIButton!
    @IBOutlet var btnReset: UIButton!
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    @IBOutlet var btn3: UIButton!
    @IBOutlet var btn4: UIButton!
    @IBOutlet var btn5: UIButton!
    @IBOutlet var btn6: UIButton!
    @IBOutlet var btn7: UIButton!
    @IBOutlet var btn8: UIButton!
    @IBOutlet var btn9: UIButton!
    @IBOutlet var btn0: UIButton!
    
    @IBOutlet var placeHolder: UIView!
    @IBOutlet var placeHolder1: UIView!
    @IBOutlet var placeHolder2: UIView!
    @IBOutlet var placeHolder3: UIView!
    @IBOutlet var placeHolder4: UIView!
    @IBOutlet var lbHello: UILabel!
    
    var userDefaults = UserDefaults.standard
    var pass:String = ""
    var check:Int = 0
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbHello.text = "Hello there"
        self.setupPlaceHolder()
    }
    
    func setupPlaceHolder(){
        placeHolder1.layer.borderColor = UIColor.white.cgColor
        placeHolder1.layer.borderWidth = 1
        placeHolder1.layer.cornerRadius = 8
        placeHolder2.layer.borderColor = UIColor.white.cgColor
        placeHolder2.layer.borderWidth = 1
        placeHolder2.layer.cornerRadius = 8
        placeHolder3.layer.borderColor = UIColor.white.cgColor
        placeHolder3.layer.borderWidth = 1
        placeHolder3.layer.cornerRadius = 8
        placeHolder4.layer.borderColor = UIColor.white.cgColor
        placeHolder4.layer.borderWidth = 1
        placeHolder4.layer.cornerRadius = 8
        
    }
    override func viewWillAppear(_ animated: Bool) {
        btn1.layer.cornerRadius = 35
        btn1.layer.borderWidth = 1
        btn1.layer.borderColor = UIColor.white.cgColor
        btn2.layer.cornerRadius = 35
        btn2.layer.borderWidth = 1
        btn2.layer.borderColor = UIColor.white.cgColor
        btn3.layer.cornerRadius = 35
        btn3.layer.borderWidth = 1
        btn3.layer.borderColor = UIColor.white.cgColor
        btn4.layer.cornerRadius = 35
        btn4.layer.borderWidth = 1
        btn4.layer.borderColor = UIColor.white.cgColor
        btn5.layer.cornerRadius = 35
        btn5.layer.borderWidth = 1
        btn5.layer.borderColor = UIColor.white.cgColor
        btn6.layer.cornerRadius = 35
        btn6.layer.borderWidth = 1
        btn6.layer.borderColor = UIColor.white.cgColor
        btn7.layer.cornerRadius = 35
        btn7.layer.borderWidth = 1
        btn7.layer.borderColor = UIColor.white.cgColor
        btn8.layer.cornerRadius = 35
        btn8.layer.borderWidth = 1
        btn8.layer.borderColor = UIColor.white.cgColor
        btn9.layer.cornerRadius = 35
        btn9.layer.borderWidth = 1
        btn9.layer.borderColor = UIColor.white.cgColor
        btn0.layer.cornerRadius = 35
        btn0.layer.borderWidth = 1
        btn0.layer.borderColor = UIColor.white.cgColor
        btnReset.layer.cornerRadius = 35
        btnReset.layer.borderWidth = 1
        btnReset.layer.borderColor = UIColor.white.cgColor
        btnBackspace.layer.cornerRadius = 35
        btnBackspace.layer.borderWidth = 1
        btnBackspace.layer.borderColor = UIColor.white.cgColor

        btnReset.setImage(btnReset.currentImage?.tint(with: UIColor.white), for: .normal)
        btnBackspace.setImage(btnBackspace.currentImage?.tint(with: UIColor.white), for: .normal)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func clickOnNumber(_ sender: Any) {
        let button = sender as! UIButton
        pass = "\(pass)\((button.titleLabel?.text)!)"
        if pass.characters.count < 4 {
            UIView.animate(withDuration: 0.2, animations: { 
                if self.pass.characters.count == 1{
                    self.placeHolder1.backgroundColor = UIColor.white
                }
                if self.pass.characters.count == 2{
                    self.placeHolder2.backgroundColor = UIColor.white
                }
                if self.pass.characters.count == 3{
                    self.placeHolder3.backgroundColor = UIColor.white
                }
                self.view.layoutIfNeeded()
            })
            print(pass)
        }else{
            if self.pass.characters.count == 4{
                self.placeHolder4.backgroundColor = UIColor.white
            }
            if pass == userDefaults.string(forKey: "PASS"){
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "MainController") as! ViewController
                self.present(controller, animated: true, completion: nil)
            }else{
                count += 1
                pass = ""
                self.placeHolder.transform = CGAffineTransform(translationX: 10, y: 0)
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [.curveLinear], animations: {
                    self.placeHolder.transform = .identity
                }, completion: nil)
                
                UIView.animate(withDuration: 0.5, animations: {
                    self.placeHolder1.backgroundColor = UIColor.clear
                    self.placeHolder2.backgroundColor = UIColor.clear
                    self.placeHolder3.backgroundColor = UIColor.clear
                    self.placeHolder4.backgroundColor = UIColor.clear
                    self.view.layoutIfNeeded()
                })
                if count >= 10 {
                    let alert = UIAlertView.init(title: "Warning", message: "Do you forget your passcode?", delegate: self, cancelButtonTitle: "No", otherButtonTitles: "Yes")
                    alert.show()
                }
            }
            
        }
    }
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 1{
            //Forget password
            print("Forget")
        }
    }
    @IBAction func clickOnButtonReset(_ sender: Any) {
        pass = ""
        UIView.animate(withDuration: 0.5, animations: {
            self.placeHolder1.backgroundColor = UIColor.clear
            self.placeHolder2.backgroundColor = UIColor.clear
            self.placeHolder3.backgroundColor = UIColor.clear
            self.placeHolder4.backgroundColor = UIColor.clear
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func clickOnButtonBackspace(_ sender: Any) {
        if pass == ""{
        }else{
            
            pass = pass.substring(to: pass.index(before: pass.endIndex))
            UIView.animate(withDuration: 0.5, animations: {
                if self.pass.characters.count == 0{
                    self.placeHolder1.backgroundColor = UIColor.clear
                }
                if self.pass.characters.count == 1{
                    self.placeHolder2.backgroundColor = UIColor.clear
                }
                if self.pass.characters.count == 2{
                    self.placeHolder3.backgroundColor = UIColor.clear
                }
                self.view.layoutIfNeeded()
            })
        }
    }

}
