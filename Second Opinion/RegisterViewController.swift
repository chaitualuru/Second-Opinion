//
//  RegisterViewController.swift
//  Second Opinion
//
//  Created by Vamsee Chamakura on 30/05/15.
//  Copyright (c) 2015 kcaluru. All rights reserved.
//

import UIKit
import Parse
import Security

class RegisterViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    let kemailKey = "emailKey"
    let kpasswordKey = "passwordKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerButton.backgroundColor = UIColor(red: 0.105, green: 0.725, blue: 0.205, alpha: 1)
        registerButton.layer.cornerRadius = 20
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonClicked(sender: UIButton) {
        let user = PFObject(className: "patients")
        user["first_name"] = firstNameTextField.text
        user["last_name"] = lastNameTextField.text
        user["email"] = emailTextField.text
        user["mobile_number"] = mobileNumberTextField.text
        user["password"] = String(passwordTextField.text)
        
        user.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            println("Object has been saved.")
        }
        
        NSUserDefaults.standardUserDefaults().setObject(self.emailTextField.text, forKey: kemailKey)
        NSUserDefaults.standardUserDefaults().setObject(self.passwordTextField.text, forKey: kpasswordKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
        self.dismissViewControllerAnimated(true, completion: nil)
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
