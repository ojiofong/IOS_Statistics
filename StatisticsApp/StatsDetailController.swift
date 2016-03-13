//
//  ThirdViewController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 2/14/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit

class StatsDetailController: UIViewController {
    
    var textTitle = "Default text value"
    var textDescription = "Default text value"
    var textExample = "Default text value"
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelExample: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        initViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = textTitle
        initViews()
    }

    @IBAction func onClickButtonTestMyKnowledge(sender: AnyObject) {
       // JLToast.makeText("Test my knowledge").show()
        showMZFormSheet()
    }
    
    func initViews(){
        labelTitle.text = textTitle
        labelDescription.text = textDescription
        labelExample.text = textExample
    }
    
    
    func showMZFormSheet(){
        let navigationController = self.storyboard!.instantiateViewControllerWithIdentifier("formsheetnavcon") as! UINavigationController
        let formSheetController = MZFormSheetPresentationViewController(contentViewController: navigationController)
        formSheetController.presentationController?.contentViewSize = CGSizeMake(300, 300)
        formSheetController.presentationController?.shouldCenterVertically = true
        formSheetController.presentationController?.shouldDismissOnBackgroundViewTap = true
        
        // Pass data
        let presentedViewController = navigationController.viewControllers.first as! QuizController
        presentedViewController.textTitle = self.textTitle
        
        self.presentViewController(formSheetController, animated: true, completion: nil)
    }
}
