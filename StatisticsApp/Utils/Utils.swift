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
    
    public static func mode(input : Double, doubleArr:[Double])->Bool{
        
        var inputCount = 0;
        var highest = 0;
        
        var asciiArr : [Int] = [Int](count: 256, repeatedValue: 0)
        
        for (index, value) in doubleArr.enumerate(){
            if(value == input){
                inputCount++;
            }
            
            
            //Ascii part
            asciiArr.insert((asciiArr[Int(value)] + 1), atIndex: Int(value))
        }
        
        for (index, value) in doubleArr.enumerate() {
            
            if(highest < asciiArr[Int(value)]){
                highest = asciiArr[Int(value)];
            }
        }
        
        
        
        return inputCount == highest;
    }
    
}
