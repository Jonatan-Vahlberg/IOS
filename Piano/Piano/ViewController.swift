//
//  ViewController.swift
//  Piano
//
//  Created by ZOG-II on 2019-01-26.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var avPlayer = AVAudioPlayer()
    let keyArray = ["c","d","e","f",
                    "g","a","b","c#",
                    "e#","f#","g#","b#"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

    @IBAction func keyPressed(_ sender: UIButton) {
        let keyValue : Int = sender.tag - 1
        let key = keyArray[keyValue]
        playSoundFromKey(key: key)
        print(sender.tag)
        
    }
    
    func playSoundFromKey(key: String){
        let url = Bundle.main.url(forResource: key, withExtension: "wav")
        
        do{
            try avPlayer = AVAudioPlayer(contentsOf: url!)
        }
        catch{
            print(error)
        }
        avPlayer.play()
    
    }

}
