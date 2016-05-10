//
//  QuizContainerController.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 5/9/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import UIKit
import SigmaSwiftStatistics
import BEMCheckBox

class QuizContainerController: UIViewController {
    
    var textTitle = ""
    var textQuestion = "Given the data below, find the "
    var arr : [Int] = []
    var isCorrect : Bool = false
    var textAns = ""
    
    
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelData: UILabel!
    @IBOutlet weak var textFieldAnswer: UITextField!
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var labelRightOrWrong: UILabel!
    
    @IBOutlet weak var benCheckBox: BEMCheckBox!
    
    
    var delegate: NextQuizProtocol?
    
    @IBAction func buttonTapNext(sender: AnyObject) {
        print("submit inside")
        self.dismissViewControllerAnimated(true, completion: nil)
        delegate?.onTapNextQuiz()
    }

    @IBAction func buttonPressedSubmit(sender: AnyObject) {
        textAns = textFieldAnswer.text!
        textAns = Utils.trim(textAns)
        
        
        if (textAns.isEmpty){
            JLToast.makeText("TextField cannot be empty").show()
        }else if (!Utils.isNumeric(textAns)){
            JLToast.makeText("Please enter a valid number").show()
        }else{
            if(isAnsCorrect(textAns, intArr: arr)){
                updateViewForCorrectAnswer()
            }else{
                updateViewForWrongAnswer()
            }
            self.view.endEditing(true)
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = generateRandomArrayOfNumbers()
        labelQuestion.text = textQuestion + textTitle
        labelData.text = String(arr)
        hideViewForCorrectOrWrongAnswer(true)    }
    
    // Called whenever user clicks outside on main view
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // hide keyboard by resigning all editing on this viewController
        self.view.endEditing(true);
    }
    
    func generateRandomArrayOfNumbers()->[Int]{
        
        let length : Int = Utils.randomNumber(3...5)  // random length of 3 to 5
        var arr : [Int] = []
        
        for i in 0 ..< length {
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
            let average = Sigma.average(getDoubleArr(intArr))
            isCorrect =  Double(answer) == roundToDecimalPlaces(average!, places: 1)
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
            let mean = Sigma.average(getDoubleArr(intArr))
            isCorrect =  Double(answer) == roundToDecimalPlaces(mean!, places: 1)
            break
            
        case "Mode":
            isCorrect =  Utils.isInputModeOfArray(Double(answer)!, doubleArr: getDoubleArr(intArr))
            break
            
        case "Sum":
            isCorrect = Double(answer) == Sigma.sum(getDoubleArr(intArr))
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
    
    
    func updateViewForWrongAnswer(){
        hideViewForCorrectOrWrongAnswer(false)
        benCheckBox.onAnimationType = BEMAnimationType.Bounce
        benCheckBox.offAnimationType = BEMAnimationType.Bounce
        benCheckBox.onFillColor = UIColor.redColor()
        benCheckBox.onTintColor = UIColor.blackColor()
        benCheckBox.onCheckColor = UIColor.redColor() //Hides this
        labelRightOrWrong.text = "Wrong! Try again"
        benCheckBox.setOn(true, animated: true)
        benCheckBox.userInteractionEnabled = false
    }
    
    func updateViewForCorrectAnswer(){
        hideViewForCorrectOrWrongAnswer(false)
        benCheckBox.onAnimationType = BEMAnimationType.Bounce
        benCheckBox.offAnimationType = BEMAnimationType.Bounce
        benCheckBox.onFillColor = UIColor.greenColor()
        benCheckBox.onTintColor = UIColor.blackColor()
        benCheckBox.onCheckColor = UIColor.blackColor() //Hides this
        labelRightOrWrong.text = "Awesome sauce!"
        benCheckBox.setOn(true, animated: true)
        benCheckBox.userInteractionEnabled = false
    }
    
    func hideViewForCorrectOrWrongAnswer(shouldHide:Bool){
        benCheckBox.hideBox = shouldHide // hide
        benCheckBox.onCheckColor = UIColor.whiteColor() //Hides this if tapped
        labelRightOrWrong.hidden = shouldHide // hide label beside
        benCheckBox.userInteractionEnabled = false // disable onInit
    }
    
    func roundToDecimalPlaces(value:Double, places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return round(value * divisor) / divisor
    }

}

protocol NextQuizProtocol {
    func onTapNextQuiz()
}
