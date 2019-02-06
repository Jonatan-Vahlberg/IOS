//
//  ViewController.swift
//  Aurora
//
//  Created by ZOG-II on 2019-01-28.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var storybook = Storybook()
    var currentPage : StorybookPage?
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var question1: UIButton!
    @IBOutlet weak var question2: UIButton!
    
    override func viewDidLoad() {
        UIApplication.shared.statusBarStyle = .lightContent
        super.viewDidLoad()
        currentPage = storybook.pages[1]!
        loadPage()
    }
    
    func loadPage(){
        
        if(currentPage?.isEnding == false){
            question2.isHidden = false
            storyLabel.text = currentPage!.story
            question1.setTitle(currentPage!.question1, for: .normal)
            question2.setTitle(currentPage!.question2, for: .normal)
        }
        else if (currentPage?.isContinuing == true){
            question2.isHidden = true
            storyLabel.text = currentPage!.story
            question1.setTitle(currentPage!.question1, for: .normal)
        }
        else if currentPage?.isEnding == true{
            question2.isHidden = true
            storyLabel.text = currentPage!.story
            question1.setTitle("Game Over Better Luck Next Time", for: .normal)
        }
        
    }

    
    @IBAction func moveForwardInStory(_ sender: UIButton) {
        if sender.tag == 1{
            currentPage = storybook.pages[(currentPage?.question1Destination)!]
        }
        else if sender.tag == 2{
            currentPage = storybook.pages[(currentPage?.question2Destination)!]
        }
        loadPage()
    }
    

}

