//
//  Score.swift
//  wherISCharlie
//
//  Created by micael  on 14/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//

import Foundation
public class Score{
    
    private  var highEasy: String
    private  var highMedium: String
    private  var highHard : String
    private  var defaults : UserDefaults
    
    init() {
        self.defaults = UserDefaults.standard
        self.highEasy = self.defaults.string(forKey: "highEasy") ?? ""
        self.highMedium =  self.defaults.string(forKey: "highMedium") ?? ""
        self.highHard = self.defaults.string(forKey: "highHard") ?? ""
    }
    
    public func setHighEasy(score :Int, message: String,courrentHightScore: String){
        
        let bestScore = self.scoreToInt(score: courrentHightScore)
        
        if(bestScore > score){
            UserDefaults.standard.set(message, forKey: "highEasy")
            self.highMedium = UserDefaults.standard.string(forKey: "highEasy")!
        }
    }
    
    
    public func setHighMedium(score :Int, message: String,courrentHightScore: String ){
        
        let bestScore = self.scoreToInt(score: courrentHightScore)
        
        if(bestScore > score){
            UserDefaults.standard.set(message, forKey: "highMedium")
            self.highMedium = UserDefaults.standard.string(forKey: "highMedium")!
        }
    }
    
    
    public func setHighHard(score :Int, message: String,courrentHightScore: String){
        
        let bestScore = self.scoreToInt(score: courrentHightScore)
        
        if(bestScore > score){
            UserDefaults.standard.set(message, forKey: "highHard")
            self.highMedium = UserDefaults.standard.string(forKey: "highHard")!
        }
    }
    
    public func getHighEasyScore() ->String{
        
        if(self.highEasy == ""){
            return "" ;
        }
        
        let fullNameArr = self.highEasy.components(separatedBy:  [":"])
        
        let message  = "Easy: \(fullNameArr[0]) en \(fullNameArr[1]) sec"
        
        return  message
    }
    
    public func getHighMediumScore() -> String{
  
        if(self.highMedium == ""){
            return "" ;
        }
        
        let fullNameArr = self.highMedium.components(separatedBy:  [":"])
        
        let message  = "Medium: \(fullNameArr[0]) en \(fullNameArr[1]) sec"
        
        return  message
    }
    
    public func getHighHardScore() -> String{
        
        if(self.highHard == ""){
            return "" ;
        }
        
        let fullNameArr = self.highHard.components(separatedBy:  [":"])
        
        let message  = "Hard: \(fullNameArr[0]) en \(fullNameArr[1]) sec"
        
        return  message
    }
    
    private func scoreToInt(score:String) ->Int{
        if(score == ""){
            return 100000
        }
        
        let fullNameArr = score.components(separatedBy:  [":"])
        return Int(fullNameArr[1])!
    }
    
    public func findMediumScore()-> String{
        return self.highMedium
    }
    
    public func findEasyScore()-> String{
        return self.highEasy
    }
    
    public func findHardScore()-> String{
        return self.highHard
    }
    
    public func resetScores(){
        UserDefaults.standard.set("", forKey: "highEasy")
        UserDefaults.standard.set("", forKey: "highMedium")
        UserDefaults.standard.set("", forKey: "highHard")
    }
    
}
