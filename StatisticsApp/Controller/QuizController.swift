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


class QuizController : UIViewController, NextQuizProtocol{
    
    var textTitle = ""
    let embeddedController : QuizContainerController? = nil
    var delegate: QuizListener?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "embeded_quiz_segue" {
            let embeddedController = segue.destinationViewController as! QuizContainerController
            embeddedController.textTitle = textTitle
            embeddedController.delegate = self
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
    
    /**
     * Implemented NextQuizProtocol method
     * Detects click from embedded viewController
     */
    func onTapNextQuiz() {
        print("outside stuff bro")
        delegate?.onSelectNext()
        // dismiss embedded Controller
        //embeddedController?.dismissViewControllerAnimated(true, completion: nil)
        // recreate embedded Controller
        //performSegueWithIdentifier("embeded_quiz_segue", sender: nil)
        
    }
  
    
}

protocol QuizListener {
    func onSelectNext()
}