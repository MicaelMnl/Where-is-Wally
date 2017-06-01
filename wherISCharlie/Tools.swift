//
//  Tools.swift
//  wherISCharlie
//
//  Created by Apprenant on 18/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//
import UIKit
import Foundation

public class Tools{
    
    
    public func showModal(arrayCharlie : ArrayCharlie, timer : Timer,time: Int, score: Score) -> UIAlertController{
    
        if(!arrayCharlie.checkCharlie()){
    
            let alert = UIAlertController(title: "Found", message: "You foun an charlie, Remainder : \(arrayCharlie.countCharlie()) ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
       }
        else{
            let alert = UIAlertController(title: "found", message: "You found charlie", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.placeholder = "nom"
            }
            
            alert.addAction(UIAlertAction(title: "END", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0]
                let name = textField?.text ?? "Micael"
                timer.invalidate()
                score.setHighEasy(score: time, message: "\(name):\(time)")
                
                let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "main")
                self.show(vc as! UIViewController, sender: vc)
            }))

        }
        
        return alert
    }
}
