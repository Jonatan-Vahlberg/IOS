//
//  ViewController.swift
//  Poem-Generator
//
//  Created by ZOG-II on 2019-01-25.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textInput1: UITextField!
    @IBOutlet weak var textInput2: UITextField!
    @IBOutlet weak var textInput3: UITextField!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var textViewPoemOut: UITextView!
    let avSpeechSynthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(identifier: "Samantha")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func GeneratePoem(_ sender: Any) {
        let out = "A Mighty " + textInput1.text! + " waddles up the stream\n\n" + "A sleek " + textInput2.text! + " caught its gleam\n\n" + "But due to its " + textInput3.text! +
        " Pound weight it fell downstream"
        
        textViewPoemOut.text = out
        let utterance = AVSpeechUtterance(string:out)
        utterance.voice = voice
        avSpeechSynthesizer.speak(utterance)
        
        
    }
    
    @IBAction func TextChangedInFeild(_ sender: Any) {
        if textInput1.text?.isEmpty ?? true{
            btnCheck.isHidden = true
        }
        else if textInput2.text?.isEmpty ?? true{
            btnCheck.isHidden = true
        }
        else if textInput3.text?.isEmpty ?? true{
            btnCheck.isHidden = true
        }
        else{
            btnCheck.isHidden = false
        }
    }
}


