//
//  DetailViewController.swift
//  ApresCuisine
//
//  Created by Himaja Motheram on 4/11/17.
//  Copyright © 2017 Sriram Motheram. All rights reserved.
//

import UIKit
import Parse
import Social

class DetailViewController: UIViewController {
    
    
    @IBOutlet internal var saveButton: UIBarButtonItem!
    
    @IBOutlet internal var dishNameTextField: UITextField!
    @IBOutlet internal var reviewTextField: UITextField!
    @IBOutlet internal var ratingTextField: UITextField!
    @IBOutlet internal var dateeatenDateField: UIDatePicker!
    @IBOutlet weak var ShareButton: UIBarButtonItem!
    
    
    var currentdish: Dish?


    override func viewDidLoad() {
       
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if currentdish == nil {
           // currentdish = Dish()
            showdefault()
        }
        else{
            let dish = currentdish
            display(dish: dish!)
        }
    }
    
    func display(dish: Dish) {
        
        dishNameTextField.text = dish.name
        reviewTextField.text = dish.review
        ratingTextField.text =  "\(dish.rating)"
        dateeatenDateField.date = dish.dateeaten!
    
        
        }

    func showdefault(){
        
        dishNameTextField.text = "Enter Dish Name here"
        dateeatenDateField.date   =  NSDate() as Date
        reviewTextField.text = "Enter Review here"
        ratingTextField.text = "0"
        
    }
    
    func setValues(dish: Dish) {
      
        dish.name = dishNameTextField.text!
        dish.review = reviewTextField.text!
        dish.dateeaten =   dateeatenDateField.date
        dish.rating = Int(ratingTextField.text!)!
        
    }


    func createTask() {
      let newdish = Dish ()
       //newdish.dateCreated = NSDate()
        
        setValues(dish: newdish)
        
        newdish.name = dishNameTextField.text!
        newdish.review = reviewTextField.text!
        newdish.dateeaten =   dateeatenDateField.date
        newdish.rating = Int(ratingTextField.text!)!
        //appDelegate.saveContext()
          newdish.saveInBackground { (success, error) in
            print("Object Saved")
            
             print("\(newdish.name)")
        }
        currentdish = newdish
    }
    
    func editTask(dish: Dish) {
        setValues(dish: dish)
           dish.saveInBackground { (success, error) in
            print("Object Saved")
        }
       
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func savePressed(button: UIBarButtonItem) {
        if let dish = currentdish {
             editTask (dish: dish)
            // print("done")
        } else {
            createTask()
        }
        // self.navigationController!.popViewController(animated: true)
    }


    @IBAction func shareButtonPressed(button: UIBarButtonItem) {
       
        let currentDish = currentdish
            
    if currentDish == nil{
        
            }
    else{
        let shareItem = "Name: \(currentDish?.name ) \(currentDish?.dateeaten!), \(currentDish?.rating),      \(currentDish?.review)"
        
        let vc = UIActivityViewController(activityItems: [shareItem], applicationActivities: nil)
        /* If you want to exclude certain types from sharing
         options you could add them to the excludedActivityTypes */
        //        vc.excludedActivityTypes = [UIActivityTypeMail]
        self.present(vc, animated: true, completion: nil)
    }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
