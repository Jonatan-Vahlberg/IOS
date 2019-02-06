//
//  Storybook.swift
//  Aurora
//
//  Created by ZOG-II on 2019-02-03.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import Foundation


class Storybook{
    
    //All Storybook pages
    var pages = [Int:StorybookPage]()
    
    //KeyEvents in story
    var keyEvents =  [String : Bool]()
    
    //TODO: Endings
    
    //TODO: MUSIC COLLECTION
    
    //TODO: Save Progress
    init(){
        pages = writeStorybook()
        keyEvents = writeKeyEvents()
    }
    
    func writeStorybook() -> [Int : StorybookPage]{
        var collection = [Int: StorybookPage]()
        collection[1] = StorybookPage(story : "It was a stormy night in mid september and few people could be seen walking the streets of Aurora, most had decided to huddle up in either thier cosy homes or in a tavern. You had made plans to meet an old friend in a remote tavern on the northen outskirts of town, but due to the weather your mood was steadily darkening. You see what you belive to be a shortcut in the form of a long dimly lit allyway and stop for a second.",
                                      question1:"Enter the allyway",
                                      question2: "Continue down the main road",
                                      question1Destination : 2,
                                      question2Destination : 3,
                                      isEnding : false)
        
        collection[2] = StorybookPage(story : "Ah what the hell if it braught you faster to the tavern it would surely be worth it, you think as you enter the allyway\n after walking for almost two minutes and still not seeing the end of the allyway you start wondering if you made the correct choice, while continuing walking you suddenly hear a low almost gutteral voice comming from behind a dark trashcan. You can't really hear what 'It' is trying to say but something compells you to move forward.",
                                      question1:"Fight your instinct and move closer",
                                      question2: "Increase your pace leaving 'It' in the shadows",
                                      question1Destination : 4,
                                      question2Destination : 3,
                                      isEnding : false)
        
        collection[3] = StorybookPage(story : "It is farther than you remember it to be , but after nearly falling twice and just barely catching yourself youve made it to the tavern.\n The taverns soft lighting and hushed murmur in contrast to the pitch black sky and roaring winds seem to hypnotize you moving your body before you make the decision yourself. Closing the door behind you the murmur turns into a buzzing sound and breaks the spell letting you regain your motor functions",
                                      question1:"Take a seat at the bar",
                                      question2: "Try to find a table along the edges of the room",
                                      question1Destination : 5,
                                      question2Destination : 6,
                                      isEnding : false)
        
        collection[4] = StorybookPage(story : "You start moving towards the sound, what seemd like a few meters suddenly feels more like a hundred meters and as if that wasn't bad enough the light seems to all but have faded. Suddenly you knock into something soft a low yelp can be heard. Taking a step back you look down upon a man in what you think could be marineblue rags that now are more hole than cloth. As you stare in silence the man asks if you can listen to his request",
                                      question1:"You nod slowly",
                                      question2: "A BUM, he...no IT dares to take your valuble time",
                                      question1Destination : 7,
                                      question2Destination : 8,
                                      isEnding : false)
        
        collection[5] = StorybookPage(story : "You gracefully aproaches the bar, the bartender a large man with a heavy beard nods to you before fixing his gaze on a glass which incomparrisson to his hand seem pitifully small, he nonetheless cleans the glasses with quick and graceful movements. You feel somewhat parched but arent sure you should start drinking before your friend arrives.",
                                      question1:"Signal the bartender for an ale",
                                      question2: "Await your friend",
                                      question1Destination : 9,
                                      question2Destination : 10,
                                      isEnding : false)
        
        collection[6] = StorybookPage(story : "You start moving trough the mass of people that inhabit the floor and various tables finnaly finding a empty but noticibly dirty table. After grabbing a washcloth from a nearby tabel giving the table a few quick motions you feel comfortable sitting down\nJust as you are about to head to the bar inorder to grab a drink you spot him, your friend, Miles Macalister standing in the doorway.",
                                      question1:"Atempt to grab his attention",
                                      question2: "",
                                      question1Destination : 9,
                                      question2Destination : 6,
                                      isContinuing : true)
        
        return collection
    }
    
    func writeKeyEvents() -> [String : Bool]{
        var collection = [String: Bool]()
        collection["KickBum"] = false
        collection["giveMoneyToBum"] = false
        
        return collection
    }
    
}
