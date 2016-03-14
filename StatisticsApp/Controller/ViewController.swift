//
//  ViewController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 2/12/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit
import SigmaSwiftStatistics




class ViewController: UIViewController {

    @IBOutlet weak var mTextLabel: UILabel!
    @IBOutlet weak var editTextField: UITextField!
    
    @IBAction func goToStatistics(sender: AnyObject) {
   //     showToastView()
        goToCustomTableViewScreen()
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        let i : Int = Int(Sigma.median([3,2,1,4,5])!)
        let s : String = "yes sir \(i)"
        print(s)
    
    }
    
    
    internal func showToastView() {
        JLToast.makeText("Hello World").show()
    }
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        let buttonTitle = sender.titleForState(.Normal)!
        mTextLabel.text = "clicked on \(buttonTitle)";
        //showMZFormSheet()
        
        //performSegueWithIdentifier("Screen3", sender: nil)
        
        // hide keyboard by resigning first responder
        self.editTextField.resignFirstResponder();
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Screen3"{
            
            let mViewConroller = segue.destinationViewController as? StatsDetailController
            mViewConroller?.textTitle = "Working bro"
        }
        
        if segue.identifier == "customTable"{
            
          //  let mViewConroller = segue.destinationViewController as? MainViewController
            //mViewConroller?.textVal = "Working bro"
            
        }
        
    }

    
    func goToCustomTableViewScreen(){
        performSegueWithIdentifier("customTable", sender: nil)
    }
    
    
    
    
    @IBAction func onButtonClicked(sender : UIButton){
        let buttonTitle = sender.titleForState(.Normal)!
        mTextLabel.text = "clicked on \(buttonTitle)";
        showAlert("clicked button 2", mMessage: "message goes here")
       // goToCustomTableViewScreen()
        
        
        // hide keyboard by resigning first responder
        self.editTextField.resignFirstResponder();
        
//        // create the alert
//        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertControllerStyle.Alert)
//        
//        // add the actions (buttons)
//        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
//        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
//        
//        // show the alert
//        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    // Called whenever user clicks outside on main view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // hide keyboard by resigning all editing
        self.view.endEditing(true);
    }
    
    func showAlert(mTitle:String, mMessage:String){
        //        // create the alert
                let alert = UIAlertController(title: mTitle, message: mMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
                // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))
                alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
                // show the alert
                self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func showMZFormSheet(){
        let navigationController = self.storyboard!.instantiateViewControllerWithIdentifier("navconid") as! UINavigationController
        let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
        formSheetController.presentationController?.contentViewSize = CGSizeMake(250, 250)
        
        self.presentViewController(formSheetController, animated: true, completion: nil)
    }
    

}



