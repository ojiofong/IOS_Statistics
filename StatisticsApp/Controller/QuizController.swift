//
//  QuizController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 3/13/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit
import SigmaSwiftStatistics

class QuizController : UIViewController, UITextFieldDelegate{
    
    var textTitle = ""
    var textQuestion = "Given the data below, find the "
    var arr : [Int] = []
    var isCorrect : Bool = false
    var textAns = ""
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var textFieldAnswer: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    
    @IBAction func buttonPressedSubmit(sender: AnyObject) {
        textAns = textFieldAnswer.text!
        textAns = Utils.trim(textAns)
        
        
        if (textAns.isEmpty){
            JLToast.makeText("TextField cannot be empty").show()
        }else if (!Utils.isNumeric(textAns)){
            JLToast.makeText("Please enter a valid number").show()
        }else{
            JLToast.makeText("submit \(textAns) is \(isAnsCorrect(textAns, intArr: arr))").show()
        }
    }
    
    /**
     *   on textField change listener
     **/
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        // Find out what the text field will be after adding the current edit
//        let text : NSString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
//        
//        print("string \(text)")
//        
//        
//        var double = text.doubleValue
//        
//        print("double \(double)")
//        print("int \(text.integerValue)")
//        
//        var ss : String = "hello"
//        
//        
//        
////        if let intVal : String = text.toInt(){
////            //print("isDouble \(true)")
////            buttonSubmit.enabled = true
////        } else {
////            //print("isDouble \(false)")
////            buttonSubmit.enabled = false
////        }
//        
//        // Return true so the text field will be changed
//        return true
//    }
    
    
    
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
        
        // if user selected "Mode" ensure duplicate exists
        if(textTitle == "Mode"){
            let val  = Utils.randomNumber(1...12)
            let lastIndex = arr.count - 1 ;
            
            arr[Utils.randomNumber(0...lastIndex)] = val
            arr[Utils.randomNumber(0...lastIndex)] = val
            arr.insert(val, atIndex: Utils.randomNumber(0...lastIndex))
            
        }
        
        return arr
    }
    
    func isAnsCorrect(answer : String, intArr : [Int])->Bool{
        
        var isCorrect : Bool = false;
        
        switch textTitle {
            
        case "Average":
            // Sigma accepts only double array so convert [Int] to [Double]
            isCorrect =  Double(answer) == Sigma.average(getDoubleArr(intArr))
            break
            
        case "Min":
            isCorrect =  Double(answer) == Sigma.min(getDoubleArr(intArr))
            break
            
        case "Max":
            isCorrect =  Double(answer) == Sigma.max(getDoubleArr(intArr))
            break
            
        case "Median":
            isCorrect =  Double(answer) == Sigma.median(getDoubleArr(intArr))
            break
            
        case "Mean":
            isCorrect =  Double(answer) == Sigma.average(getDoubleArr(intArr))
            break
            
        case "Mode":
            isCorrect =  Utils.isInputModeOfArray(Double(answer)!, doubleArr: getDoubleArr(intArr))
            break
            
        default:
            // do nothing
            break
            
            
        }
        
        return isCorrect;
    }
    
    func getDoubleArr(intArr : [Int])->[Double]{
        
        var doubleArr : [Double] = [];
        
        for (index, value) in intArr.enumerate() {
            doubleArr.insert(Double(value), atIndex: index)
        }
        
        return doubleArr;
    }
    
    
}
