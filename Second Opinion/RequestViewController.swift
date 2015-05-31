//
//  RequestViewController.swift
//  Second Opinion
//
//  Created by Krishna Chaitanya Aluru on 5/31/15.
//  Copyright (c) 2015 kcaluru. All rights reserved.
//

import UIKit
import Parse
import Bolts

class RequestViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var descprtxtfield: UITextField!
    
    @IBOutlet weak var starttimetxtfield: UITextField!
    var pickerDataSource = ["Allergist", "Anesthesiologist", "Cardiologist", "Dermatologist", "Gastroenterologist", "Neurologist", "Oncologist", "Nephrologist", "Obstetrician", "Gynecologist", "Ophthalmologist", "Pathologist", "Pediatrician", "Podiatrist", "Psychiatrist", "Urologist", "Radiation Oncologist", "Rhuematologist"];
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    @IBOutlet weak var endtimetxtfield: UITextField!
    var flag = 0;
    
    @IBOutlet weak var specialitypicker: UIPickerView!
    
    
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
    @IBAction func takeAPicture(sender: AnyObject) {
        self.flag = 2
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        imageView = imageView2
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    
    @IBAction func pickFromGallery(sender: AnyObject) {
        self.flag = 1
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        if self.flag == 1{
            imageView.hidden = false
            imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
        else{
            imageView2.hidden = false
            picker.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func uploadButtonPressed(sender: AnyObject) {
        
        if self.flag == 1 {
            if imageView.image == nil {
                println("No image")
            } else {
                var images = PFObject(className: "RequestObject")
                images.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        var imageData = UIImageJPEGRepresentation(self.imageView.image, CGFloat(0.5))
                        var parseImageFile = PFFile(name: "upload.png", data: imageData)
                        images["image"] = parseImageFile
                        images["description"] = self.descprtxtfield.text
                        images["phone_number"] = NSUserDefaults.standardUserDefaults().objectForKey("kmobileKey")
                        images["start_time"] = self.starttimetxtfield.text
                        images["end_time"] = self.endtimetxtfield.text
                        images["patientName"] = NSUserDefaults.standardUserDefaults().objectForKey("kuserKey")
                        images["speciality"] = self.pickerDataSource[self.specialitypicker.selectedRowInComponent(Int())]
                        images.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                            if error == nil {
                                println("Done")
                            } else {
                                println(error)
                            }
                        })
                        
                    }else {
                        println(error)
                    }
                })
            }
        } else {
            if imageView2.image == nil {
                println("No image")
            } else {
                var images = PFObject(className: "RequestObject")
                images.saveInBackgroundWithBlock({
                    (success: Bool, error: NSError?) -> Void in
                    
                    if error == nil {
                        var imageData = UIImageJPEGRepresentation(self.imageView2.image, CGFloat(0.5))
                        var parseImageFile = PFFile(name: "upload.png", data: imageData)
                        images["image"] = parseImageFile
                        images["image"] = parseImageFile
                        images["description"] = self.descprtxtfield.text
                        images["phone_number"] = NSUserDefaults.standardUserDefaults().objectForKey("kmobileKey")
                        images["start_time"] = self.starttimetxtfield.text
                        images["end_time"] = self.endtimetxtfield.text
                        images["patientName"] = NSUserDefaults.standardUserDefaults().objectForKey("kuserKey")
                            images["speciality"] = self.pickerDataSource[self.specialitypicker.selectedRowInComponent(Int())]
                        images.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                            if error == nil {
                                println("Done")
                            } else {
                                println(error)
                            }
                        })
                        
                    }else {
                        println(error)
                    }
                })
            }
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
