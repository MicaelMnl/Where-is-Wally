//
//  MenuController.swift
//  wherISCharlie
//
//  Created by micael on 14/05/2017.
//  Copyright © 2017 micael. All rights reserved.
//
import UIKit
import Foundation
class EasyViewController: UIViewController , UIScrollViewDelegate{
    
    @IBOutlet var scrollView: UIScrollView!
    let imageView = UIImageView(image: UIImage(named: "bck-e.jpg")!)
    let labelView  = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    
    var time:Int = 0
    var timer:Timer = Timer()
    
    var score:Score = Score()
    
    var arrayCharlie: ArrayCharlie = ArrayCharlie()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        scrollView.addSubview(imageView)
        imageView.addSubview(labelView)
        scrollView.delegate = self;
        
        
        let x = Double(imageView.frame.width)
        let y = Double(imageView.frame.height)
        
        labelView.text = "0"
        labelView.textAlignment = .center
        labelView.textColor = .white
        labelView.font = UIFont(name: "Heiti TC", size: 120)
        labelView.frame.size = imageView.frame.size
        let centerX = x / 2 - 120
        let centerY = y / 2 - 120
        
        labelView.center = CGPoint(x: centerX, y: centerY)
        
        let width = UIScreen.main.bounds.height / imageView.frame.height ;
        scrollView.maximumZoomScale = 6.0
        scrollView.minimumZoomScale = width
        
        scrollView.zoomScale = 1.0
        
        scrollView.contentSize = imageView.frame.size
        
        scrollView.isUserInteractionEnabled = true
        scrollView.isScrollEnabled = true
        scrollView.bounces=true
        
        scrollView.delaysContentTouches = true
        scrollView.canCancelContentTouches = false
        
        imageView.isUserInteractionEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EasyViewController.action), userInfo: nil, repeats: true)
        
        
        let image = UIImage(named: "charlie-image.png") as UIImage?
        let button   = UIButton()
        button.setImage(image, for: .normal)
        button.frame.size =  CGSize(width: 20, height: 30)
        button.tag = 0
        let charlie = Charlie(charlie: button)
        charlie.setPosition(x: x, y: y)
        button.addTarget(self, action: #selector(EasyViewController.clicked), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        arrayCharlie.addCharlie(charlie: charlie)
        
        imageView.addSubview(button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    func action(){
        time += 1
        labelView.text = String(time)
        
    }
    
    func clicked(sender: UIButton!) {
        
        arrayCharlie.removeCharlie(index: sender.tag)
        var alert = UIAlertController()
        if(!arrayCharlie.checkCharlie()){
            
            alert = UIAlertController(title: "Found", message: "You foun an charlie, Remainder : \(arrayCharlie.countCharlie()) ", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.default, handler: nil))
            
        }else{
            timer.invalidate()

            alert = UIAlertController(title: "found", message: "You found charlie Score \(self.time)", preferredStyle: .alert)
            
            alert.addTextField { (textField) in
                textField.placeholder = "nom"
            }
            
            alert.addAction(UIAlertAction(title: "END", style: .default, handler: { [weak alert] (_) in
                let textField = alert?.textFields![0]
                let name = textField?.text ?? "Micael"
                self.score.setHighEasy(score: self.time, message: "\(name):\(self.time)", courrentHightScore : self.score.findEasyScore())
                
                let vc : AnyObject! = self.storyboard!.instantiateViewController(withIdentifier: "main")
                self.show(vc as! UIViewController, sender: vc)
                
                //self.navigationController?.popToRootViewController(animated: true)
            }))
        }
        
        self.present(alert, animated: true, completion: nil)
        
        sender.isHidden = true
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    
}

