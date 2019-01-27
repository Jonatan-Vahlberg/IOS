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
    @IBOutlet var mainTitle: UILabel!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var imageViewBackground: UIImageView!
    
    
    
    let avSpeechSynthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(identifier: "Samantha")
    var page : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePage()
        
    }
    
    @IBAction func GeneratePoem(_ sender: Any) {
        var out : String = " "
            
        if(page == 1){
            let weightInPounds : String = String(Int(textInput3.text!)! * 2)
            let out1 : String = "A Mighty " + textInput1.text! + " waddles up the stream\n"
            let out2 : String = "A sleek "+textInput2.text!+" caught its gleam\n"
            let out3  = "But due to its " + weightInPounds + " pound weight it fell down stream"
            out = out1 + out2 + out3
        }
        else if(page == 2){
            let out1 : String = "Snowfall of the " + textInput1.text! + "\n\n"
            let out2 : String = "Turn away of "+textInput2.text!+" received\n\n"
            let out3  = "Grumble in " + textInput3.text! + " time"
            out = out1 + out2 + out3
        }
        else if(page == 3){
            let out1 : String = "Work in " + textInput1.text! + "\n\n"
            let out2 : String = "and let " + textInput2.text! + " make the " + textInput3.text!
            
            out = out1 + out2
        }
        
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
    
    @IBAction func ChangePane(_ sender: UIButton) {
        let choice : Int = sender.tag
        
        if page == 1 && choice == -1{
            page = 3
            generatePage()
        }
        else if page == 3 && choice == 1{
            page = 1
            generatePage()
        }
        else{
            page = page + choice
            generatePage()
        }
    }
    
    func generatePage(){
        
        if page == 1{
            mainTitle.text = "Poem Generator"
            firstLabel.text = "Large Animal"
            secondLabel.text = "Food"
            thirdLabel.text = "Weight In Kilos"
            textViewPoemOut.text = "A Mighty ... waddles up the stream\nA sleek ... caught its gleam\nBut due to its ... Pound weight it fell downstream"
            imageViewBackground.image = #imageLiteral(resourceName: "river")
            
        }
        else if page == 2{
            mainTitle.text = "Haiku Generator"
            firstLabel.text = "One Syllable"
            secondLabel.text = "Two Syllables"
            thirdLabel.text = "One Syllable"
            textViewPoemOut.text = "Snowfall of the ...\n\nTurn away of ... received\n\nGrumble in ... time"
            imageViewBackground.image = #imageLiteral(resourceName: "haiku")
        }
        else if page == 3{
            mainTitle.text = "Insperation Generator"
            firstLabel.text = "Adjective"
            secondLabel.text = "Noun"
            thirdLabel.text = "Noun"
            textViewPoemOut.text = "Work ... in silence\n\nand let ... make the ..."
            imageViewBackground.image = #imageLiteral(resourceName: "isperational")
        }
    }
}


