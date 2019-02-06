//
//  ResultController.swift
//  Last Minute Meal
//
//  Created by ZOG-II on 2019-02-05.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

protocol CanRecive{
    func returned()
}

class ResultController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var content: UIView!
    @IBOutlet weak var stack: UIStackView!
    var delegate : CanRecive?
    var recepies = [RecepieModel]()
    var recepieLinks = [Int : String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createViewsAsNeeded()

       
    }
    
    func createViewsAsNeeded(){
        
        if recepies.count > 0{
            
            var i : Int = 1
            for recepie in recepies{
                var newView = UIView(frame: CGRect(x: 0, y: 128*i, width: 240, height: 128))
                newView.isUserInteractionEnabled = true
                var name = UILabel(frame: CGRect(x: 8, y: 10, width: 224, height: 21))
                
                name.text = recepie.name
                
                
                var button = UIButton()
                button.frame = CGRect(x: 45, y: 100, width: 150, height: 28)
                button.backgroundColor = UIColor.black
                button.setTitle("Link to Recepie", for: .normal)
                recepieLinks[recepie.id] = recepie.recepieURL
               button.tag = recepie.id
                button.addTarget(self, action: #selector(self.prepareToLeave(sender:)), for: .touchUpInside)
                button.isUserInteractionEnabled = true
                
                
                newView.addSubview(name)
                newView.addSubview(button)
                content.addSubview(newView)
                //¢self.view.bringSubview(toFront: button)
                
                i += 1
            }
        }
    }
    @objc func prepareToLeave(sender: UIButton){
        leaveApp(url: recepieLinks[sender.tag]!)
    }
    func leaveApp(url : String){
        UIApplication.shared.openURL(URL(string: url)!)
        

    }

}
