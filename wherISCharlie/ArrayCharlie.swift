//
//  ArrayCharlie.swift
//  wherISCharlie
//
//  Created by micael on 13/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//

import Foundation
public class ArrayCharlie{
    
    private var collection:Array<Charlie> = []
    
    
    public func checkCharlie() -> Bool{
        
        for charlie in self.collection{
            if(charlie.getFound() == false){
                return false
            }
        }
        
        return  true
    
    }
    
    public func addCharlie(charlie : Charlie){
        self.collection.append(charlie)
    }
    
    public func  countCharlie() -> Int{
        
        var nbCharlie:Int = 0
        for charlie in self.collection{
            if(charlie.getFound() == false){
                nbCharlie += 1
            }
        }
        return  nbCharlie
    }
    
    public func removeCharlie(index : Int)
    {
        let charlie: Charlie = self.collection[index]
        charlie.setFound()
    }
    
}
