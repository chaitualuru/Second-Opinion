//
//  LoginViewController.swift
//  Second Opinion
//
//  Created by Vamsee Chamakura on 30/05/15.
//  Copyright (c) 2015 kcaluru. All rights reserved.
//

import UIKit
import Parse
import Bolts

let kemailKey = "emailKey"
let kpasswordKey = "passwordKey"


class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var border = CALayer()
        var width = CGFloat(1.0)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: emailTextField.frame.size.height - width, width:  emailTextField.frame.size.width, height: emailTextField.frame.size.height)
        
        border.borderWidth = width
        emailTextField.layer.addSublayer(border)
        emailTextField.layer.masksToBounds = true
        
        var borderPassword = CALayer()
        borderPassword.borderColor = UIColor.lightGrayColor().CGColor
        borderPassword.frame = CGRect(x: 0, y: passwordTextField.frame.size.height - width, width:  passwordTextField.frame.size.width, height: passwordTextField.frame.size.height)
        
        borderPassword.borderWidth = width
        passwordTextField.layer.addSublayer(borderPassword)
        passwordTextField.layer.masksToBounds = true
        
        loginButton.backgroundColor = UIColor(red: 0.105, green: 0.725, blue: 0.205, alpha: 1)
        loginButton.layer.cornerRadius = 20
        
    }

    @IBAction func loginOnPressed(sender: AnyObject) {
        println("Query Part")
        var query = PFQuery(className:"patients")
        query.whereKey("email", equalTo:emailTextField.text)
        query.whereKey("password", equalTo: passwordTextField.text)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                println(objects)
                if let objects = objects as? [PFObject] {
                    for object in objects {
                        println(object)
                        println("succesful!")
                        NSUserDefaults.standardUserDefaults().setObject(self.emailTextField.text, forKey: kemailKey)
                        NSUserDefaults.standardUserDefaults().setObject(self.passwordTextField.text, forKey: kpasswordKey)
                        NSUserDefaults.standardUserDefaults().synchronize()
                    }
                }
            }
            else {
                // Log details of the failure
                println("Error: \(error!) \(error!.userInfo!)")
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
