//
//  QuizController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 3/13/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit

class QuizController : UIViewController{
    
    var textTitle = ""
    var textQuestion = "Given the data below, find the "
    var arr : [Int] = []
    var isCorrect : Bool = false
    var textAns = ""
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var textFieldAnswer: UITextField!
    
    @IBAction func buttonPressedSubmit(sender: AnyObject) {
        textAns = textFieldAnswer.text!
        JLToast.makeText("submit \(textAns) is \(isCorrect)").show()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = textTitle
        arr = generateRandomArrayOfNumbers()
        labelQuestion.text = textQuestion + textTitle
        labelData.text = String(arr)
    }
    
    // Called whenever user clicks outside on main view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // hide keyboard by resigning all editing on this viewController
        self.view.endEditing(true);
    }
    
    func generateRandomArrayOfNumbers()->[Int]{
        
        let length : Int = Utils.randomNumber(3...5)  // random length of 3 to 5
        var arr : [Int] = []
        
        for var i = 0; i < length; i++ {
            let element : Int = Utils.randomNumber(1...12) // random number from 1 to 12
            arr.insert(element, atIndex: i)
        }
        
        return arr
    }
    
}
