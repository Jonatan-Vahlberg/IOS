//
//  StorybookPage.swift
//  Aurora
//
//  Created by ZOG-II on 2019-02-03.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import Foundation

class StorybookPage{
    //Required
    let story : String
    
    
    let question1 : String
    let question2 : String
    
    let question1Destination : Int
    let question2Destination : Int
    
    //Optionals
    var question3 : String?
    var question4 : String?
    
    var question3Destination : Int?
    var question4Destination : Int?
    
    //Acsess variable for reaching optionals
    var keyIdentifier1 : String?
    var keyIdentifier2 : String?
    
    //Is the page an Ending
    var isEnding : Bool?
    var isContinuing : Bool?
    
    //TODO: Music Identifier
    
    //Constructor
    init(story : String, question1:String,question2: String,question1Destination : Int,question2Destination : Int, isEnding : Bool) {
        self.story = story
        self.question1 = question1
        self.question2 = question2
        self.question1Destination = question1Destination
        self.question2Destination = question2Destination
        self.isEnding = isEnding
        
    }
    
    //No Choice page
    init(story : String, question1:String,question2: String,question1Destination : Int,question2Destination : Int, isContinuing : Bool) {
        self.story = story
        self.question1 = question1
        self.question1Destination = question1Destination
        self.question2 = question2
        self.question2Destination = question2Destination
        self.isContinuing = isContinuing
        
    }
}
