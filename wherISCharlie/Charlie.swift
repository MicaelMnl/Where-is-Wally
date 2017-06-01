//
//  Charlie.swift
//  wherISCharlie
//
//  Created by micael on 13/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//
import UIKit
import Foundation

public class Charlie {
    
    private var charlie: UIButton!
    private var found: Bool
    
    init(charlie: UIButton ) {
        self.charlie  = charlie
        self.found = false
    }
    
    public func setPosition(x: Double, y: Double){
        
        let x: Double = x - 25
        let y: Double = y - 35
        
        let axeX = Int(arc4random_uniform(UInt32(x)) + UInt32(25))
        let axeY = Int(arc4random_uniform(UInt32(y)) + UInt32(35))
        
        self.charlie.frame.origin = CGPoint(x: axeX , y: axeY);
    }
    
    public func setFound(){
        self.found = true
    }
    
    public func getFound() -> Bool{
        return self.found
    }
}
