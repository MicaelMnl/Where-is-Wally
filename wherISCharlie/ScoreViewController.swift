//
//  ScoreViewController.swift
//  wherISCharlie
//
//  Created by micael on 15/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//
import UIKit
import Foundation
class ScoreViewController: UIViewController{
    
    
    @IBOutlet weak var easy: UILabel!
  
    @IBOutlet weak var hard: UILabel!
    @IBOutlet weak var medium: UILabel!
    var score: Score = Score()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        easy.text = score.getHighEasyScore()
        medium.text = score.getHighMediumScore()
        hard.text = score.getHighHardScore()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
