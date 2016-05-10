//
//  QuizController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 3/13/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit
import SigmaSwiftStatistics
import BEMCheckBox


class QuizController : UIViewController{
    
    var textTitle = ""
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embeded_quiz_segue" {
            let controller = segue.destinationViewController as! QuizContainerController
            controller.textTitle = textTitle
           // controller.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = textTitle
        customizeNavigationBar()
    }

    func customizeNavigationBar(){
        // Remove nav bar bottom border
        navigationController?.navigationBar.shadowImage = UIImage();
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    }
  
    
}
