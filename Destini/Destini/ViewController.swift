//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let storyBook = Story().storyDictionary
    var currentPage : StoryObject!
    
    
    
    
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentPage = storyBook[1]
        updatePage()
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        if(sender.tag == 1){
            currentPage = storyBook[currentPage.answer1Identefier]
            updatePage()
        }
        else if(sender.tag == 2){
            currentPage = storyBook[currentPage.answer2Identefier]
            updatePage()
        }
        
    
    }
    
    func updatePage(){
        storyTextView.text = currentPage.story
        topButton.setTitle(currentPage.answer1, for: .normal)
        if(currentPage.answer2Identefier == -1){
            bottomButton.isHidden = true
        }else{
            bottomButton.isHidden = false
            bottomButton.setTitle(currentPage.answer2, for: .normal)

        }
    }
    



}

