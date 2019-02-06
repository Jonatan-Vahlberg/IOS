//
//  RecepieModel.swift
//  Last Minute Meal
//
//  Created by ZOG-II on 2019-02-05.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import Foundation
import UIKit

class RecepieModel{
    
    let id: Int
    let name : String
    let imageURL : String
    var recepieImage = UIImage()
    
    let maxIngredients : Int
    let usedIngredients : Int
    var recepieURL : String  = "https://spoonacular.com/recipes/"
    
    init(id:Int,name:String,url:String,mIngredients:Int,uIngredients:Int) {
        
        self.id = id
        self.name = name
        self.imageURL = url
        self.maxIngredients = mIngredients
        self.usedIngredients = uIngredients
        
        //createImgfromUrl()
    }
    
    func createImgfromUrl(){
        let imgAsURL = URL(string: imageURL)
        
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData:NSData = NSData(contentsOf: imgAsURL!)!
            
            DispatchQueue.main.async {
                self.recepieImage = UIImage(data: imageData as Data)!
            }
        }
    }
}
