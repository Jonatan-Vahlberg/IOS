//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by ZOG-II on 2019-01-26.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ballFaces = ["ball1","ball2","ball3","ball4","ball5"]
    
    @IBOutlet weak var ballFaceImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func rollBall(_ sender: UIButton) {
        changeFace()
    }
    
    func changeFace(){
        let randomNr = Int(arc4random_uniform(5))
        
        ballFaceImage.image = UIImage(named: ballFaces[randomNr])
        ballFaceImage.isHidden = false
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {

        changeFace()
        ballFaceImage.isHidden = false
        
    }
    
}

