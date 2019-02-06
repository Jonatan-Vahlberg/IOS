//
//  ViewController.swift
//  Last Minute Meal
//
//  Created by ZOG-II on 2019-02-04.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension String{
    //Stripps string of any special characters
    var stripped: String{
        let okaychars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ")
        return self.filter {okaychars.contains($0)}
        
    }
}

class ViewController: UIViewController, CanRecive {
    
    func returned() {
        
    }
    

    var ingredientsUI = [Int: UIView]()
    var ingredientsList = [String]()
    var recepieList = [RecepieModel]()
    
    
    @IBOutlet weak var ingredientsStack: UIStackView!
    
    @IBOutlet weak var ingredientView1: UIView!
    @IBOutlet weak var text1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredientsUI[1] = ingredientView1
        
    }

    // MARK: UI Implementation
    @IBAction func addNewIngredient(_ sender: UIButton) {
        CreateView()
        
    }
    
    @IBAction func getRecepiesFromIngredients(_ sender: Any) {
        ingredientsList.removeAll()
        for index in 1...ingredientsUI.count{
            let textFeild: UITextField = ingredientsStack.viewWithTag(index) as! UITextField
            let ingredient = textFeild.text
            ingredientsList.append(ingredient!)
        }
        getRecepieData()
        
        
    }
    @objc func CreateView(){
        let newView = UIView()
        newView.frame = CGRect(x: 0, y:0, width: ingredientView1.frame.width, height: 80)
        newView.backgroundColor = UIColor(white: 1, alpha: 0)
        
        
        
        let textFeild = UITextField()
        textFeild.frame = CGRect(x: 8, y: 8, width: text1.frame.width, height: 30)
        textFeild.backgroundColor = UIColor.white
        textFeild.layer.cornerRadius = 5.0
        textFeild.placeholder = "New Ingredient"
        textFeild.tag = ingredientsUI.count+1
        
        
        //textFeild.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        let minus = UIButton()
        minus.setTitle("-", for: .normal)
        minus.tag = ingredientsUI.count+1
        minus.frame = CGRect(x: text1.frame.width + 8, y: 8, width: 21, height: 30)
        minus.addTarget(self, action: #selector(self.removeSubView(sender:)), for: .touchUpInside)
        
        
        
        newView.addSubview(textFeild)
        newView.addSubview(minus)
        ingredientsUI[ingredientsUI.count+1] = newView
        
        
        ingredientsStack.addArrangedSubview(newView)
        
    }
    
    @objc func removeSubView(sender : UIButton){
        
        ingredientsStack.removeArrangedSubview(ingredientsUI[sender.tag]!)
        ingredientsUI[sender.tag]?.removeFromSuperview()
        ingredientsUI.removeValue(forKey: sender.tag)
    }
    
    // MARK: Networking With Alamofire
    
    func getRecepieData(){
        
        let headers: HTTPHeaders =
        ["X-RapidAPI-Key" : "48a4bafadamshebea31e60190452p1b7d55jsn569e535ca6bf"]
        
        let URLpart = createURLForSpoonacular()
        let url = "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/findByIngredients?number=5&limitLicense=true&ranking=1&ingredients=" + URLpart
        Alamofire.request(url, headers: headers).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success databse contacted")
                let recepieResults : JSON = JSON(response.result.value)
                print(recepieResults)
                self.updateRecepieData(json: recepieResults)
            }
            else{
                print("Error \(response.result.error)")
                self.text1.text = "Request Unavailable"
            }
        }
        
    }
    
    func createURLForSpoonacular() -> String{
        var URLpart : String = ""
        for ingredient in ingredientsList{
            
            if(ingredientsList.index(of: ingredient) == (ingredientsList.count - 1)){
                URLpart += ingredient
            }
            else{
                URLpart += ingredient + "%2C"
            }
        }
        
        return URLpart.lowercased()
    }
    
    //MARK: JSON parsing
    
    func updateRecepieData(json : JSON){
        var i : Int = 0
        while json[i]["id"] != JSON.null{
            let id = json[i]["id"].int
            let name = json[i]["title"].string
            let url = json[i]["image"].string
            let used = json[i]["usedIngredientCount"].int
            let missed = json[i]["missedIngredientCount"].int
            var model = RecepieModel(id: id!, name: name!, url: url!, mIngredients: missed!, uIngredients: used!)
            var stringId = String(model.id)
            var urlSpesificName : String = (name?.stripped)!
            urlSpesificName = urlSpesificName.lowercased()
            urlSpesificName = urlSpesificName.replacingOccurrences(of: " ", with: "-")
            model.recepieURL += urlSpesificName + "-" + stringId
            
            recepieList.append(model)
            i += 1
        }
        performSegue(withIdentifier: "showRecepies", sender: self)
    }
    //MARK: LEAVING VIEWCONTROLLER
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showRecepies"){
            let secondVC = segue.destination as! ResultController
            
            for recepie in recepieList{
                secondVC.recepies.append(recepie)
            }
            
            secondVC.delegate = self
        }
    }
    
    

}

