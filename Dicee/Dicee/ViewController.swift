//
//  ViewController.swift
//  Dicee
//
//  Created by ZOG-II on 2019-01-25.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    let diceFaceArray = ["dice1","dice2","dice3",
                         "dice4","dice5","dice6"]
    
    var player = AVAudioPlayer()

    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceFaces()
        
        let path = Bundle.main.path(forResource: "dice", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
            
        }catch(let err as NSError){
            print(err.description)
        }
    }

    func playDiceSound() {
        player.stop()
        player.currentTime = 0
        player.play()
    }
    
    @IBAction func btnRollDicee(_ sender: UIButton) {
        
        updateDiceFaces()
        playDiceSound()
        
        
    }
    
    func updateDiceFaces() {
        
        randomDiceIndex1 =  Int(arc4random_uniform(6))
        randomDiceIndex2 =  Int(arc4random_uniform(6))
        imageDice1.image = UIImage(named:diceFaceArray[randomDiceIndex1])
        imageDice2.image = UIImage(named:diceFaceArray[randomDiceIndex2])
    }
}

