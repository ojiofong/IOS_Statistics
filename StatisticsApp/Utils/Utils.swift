//
//  Utils.swift
//  StatisticsApp
//
//  Created by Oji Ofong on 3/13/16.
//  Copyright © 2016 Oji Ofong. All rights reserved.
//

import Foundation

public class Utils {
    
    // default range is 1 to 6
    public static func randomNumber(range: Range<Int> = 1...6) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
    /**
     * Calculates statistical Mode
     */
    public static func isInputModeOfArray(input : Double, doubleArr:[Double])->Bool{
        
        var inputCount = 0;
        var highest = 0;
        
        var asciiArr : [Int] = [Int](count: 256, repeatedValue: 0)
        
        for (_, value) in doubleArr.enumerate(){
            if(value == input){
                inputCount += 1
            }
            
            //Ascii part
            asciiArr[Int(value)] += 1
        }
        
        for (_, value) in doubleArr.enumerate() {
            
            if(highest < asciiArr[Int(value)]){
                highest = asciiArr[Int(value)];
            }
        }
        
        
        
        return inputCount == highest;
    }
    
    /**
     * Removes whitespace from both ends of a string
     */
    public static func trim(str : String) -> String {
        return str.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    /**
     * checks if a string is numeric
     * Algorithm ensures string contains characters 0-9 and one dot only
     * O(n) time & O(n) space
     */
    public static func isNumeric(str : String) -> Bool {
        
        if ( str.isEmpty ) {
            return false;
        }
        
        let length = str.characters.count
        var dotCount = 0;
        var dict : [Character : Character] = ["0":"0", "1":"1", "2":"2", "3":"3", "4":"4", "5":"5", "6":"6", "7":"7", "8":"8", "9":"9", ".":"."]
        
        for i in 0 ..< length {
            
            // check check if every character is in dictionary
            let c : Character = str[str.startIndex.advancedBy(i)]
            if (dict[c] == nil) {
                return false
            }
            
            // check for duplicate "." character
            if (c == ".") {
                dotCount += 1
                if (dotCount > 1){
                    return false
                }
            }
        }
        
        return true
    }
    
    
}
