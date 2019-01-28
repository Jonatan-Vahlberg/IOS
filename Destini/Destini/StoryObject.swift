//
//  StoryObject.swift
//  Destini
//
//  Created by ZOG-II on 2019-01-28.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class StoryObject{

    let story : String
    
    let answer1 : String
    let answer1Identefier : Int
    
    let answer2 : String
    let answer2Identefier : Int
    
    init(story : String,answ1 : String,answ2 : String,answ1ID : Int,answ2ID : Int){
        
        self.story = story
        self.answer1 = answ1
        self.answer2 = answ2
        self.answer1Identefier = answ1ID
        self.answer2Identefier = answ2ID
        
    }
    
}
