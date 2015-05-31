//
//  RequestViewController.swift
//  Second Opinion
//
//  Created by Krishna Chaitanya Aluru on 5/31/15.
//  Copyright (c) 2015 kcaluru. All rights reserved.
//

import UIKit

class RequestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var createButton: UIButton!
    
    var pickerDataSource = ["Allergist", "Anesthesiologist", "Cardiologist", "Dermatologist", "Gastroenterologist", "Neurologist", "Oncologist", "Nephrologist", "Obstetrician", "Gynecologist", "Ophthalmologist", "Pathologist", "Pediatrician", "Podiatrist", "Psychiatrist", "Urologist", "Radiation Oncologist", "Rhuematologist"];
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createButton.backgroundColor = UIColor(red: 0.105, green: 0.725, blue: 0.205, alpha: 1)
        createButton.layer.cornerRadius = 20


        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.pickerView.transform = CGAffineTransformMakeScale(0.75, 0.65)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerDataSource[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "createRequestSegue") {
            MainViewController.requestCreated = true
        }
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
