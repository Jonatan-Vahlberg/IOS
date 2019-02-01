//
//  ViewController.swift
//  Bouncing Ball
//
//  Created by ZOG-II on 2019-01-30.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    @IBOutlet var ball: UIImageView!
    @IBOutlet var backgroundView: UIImageView!
    let player = AVAudioPlayer()
    
    var timer = Timer()
    var down : Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        ball.loadGif(name: "trippy spiral")
        timer = Timer.scheduledTimer(timeInterval: 1.1, target: self, selector: #selector(ViewController.move), userInfo: nil, repeats: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func move()
    {
        let safeWidth = (self.backgroundView.frame.width - 100)
        let safeHeight = (self.backgroundView.frame.height - 100)
        let min = 50
        let max = 800
        let safeFrame = CGFloat(min * Int(arc4random()) % (max - min))
        
        
        if(down == false){
            UIView.animate(withDuration: 5, animations: {
                self.ball.frame = CGRect(x: CGFloat(arc4random_uniform(UInt32(safeWidth))) , y: CGFloat(arc4random_uniform(UInt32(safeHeight))), width: safeFrame, height: safeFrame)
                self.ball.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(960)))
                
            }) {(finished) in
                self.down = true
            }
        }
        else
        {
            UIView.animate(withDuration: 5, animations: {
                self.ball.frame = CGRect(x: CGFloat(arc4random_uniform(UInt32(safeWidth))) , y: CGFloat(arc4random_uniform(UInt32(safeHeight))), width: 100, height: 100)
                self.ball.transform = CGAffineTransform(rotationAngle: CGFloat(arc4random_uniform(360)))
                
            }) {(finished) in
                self.down = false
            }
        }
    }


}

