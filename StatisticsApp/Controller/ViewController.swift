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
    @IBOutlet weak var buttonRight: UIButton!
    
    @IBAction func goToStatistics(sender: AnyObject) {
   //     showToastView()
        goToCustomTableViewScreen()
    }
    
    
    func setViewControllerTitle( mTitle : String){
        self.title = mTitle
    }
    
    
    override func viewWillAppear(animated: Bool) {
        
        setViewControllerTitle(Const.APP_NAME)
        hideUnwantedView()
        customizeNavBar();
        
        let i : Int = Int(Sigma.median([3,2,1,4,5])!)
        let s : String = "yes sir \(i)"
        print(s)
    
    }
    
    
    func hideUnwantedView(){
        // hide the buttom right button
        buttonRight.hidden = true
    }
    
    
    internal func showToastView() {
        JLToast.makeText("Hello World").show()
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
        //setViewControllerTitle("") // Update the back button of the next viewController
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
    
    func customizeNavBar(){
        // customize navigation bar
        let nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Black
        nav?.tintColor = UIColor.yellowColor()
    
        let myAppBackgroundColor = self.view.backgroundColor
        nav?.barTintColor = myAppBackgroundColor
        
        // change nav bar height and width
        //let screen = UIScreen.mainScreen().bounds
        //let screenWidth = screen.size.width
        //let screenHeight = screen.size.height
        
        // nav?.frame=CGRectMake(0, 0, screenWidth, 70)  // Here you can set you Width and Height for your navBar
        
    }
    

}



