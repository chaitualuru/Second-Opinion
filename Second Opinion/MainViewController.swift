//
//  MainViewController.swift
//  Second Opinion
//
//  Created by Vamsee Chamakura on 30/05/15.
//  Copyright (c) 2015 kcaluru. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    static var requestCreated = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if MainViewController.requestCreated {
            let alert = UIAlertView()
            alert.title = "All Set!"
            alert.message = "Your request has been created. A doctor will contact you soon!"
            alert.addButtonWithTitle("OK")
            alert.show()
            MainViewController.requestCreated = false
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
