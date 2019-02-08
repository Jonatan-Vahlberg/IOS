//
//  RecepieCell.swift
//  Last Minute Meal
//
//  Created by ZOG-II on 2019-02-08.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

class RecepieCell: UITableViewCell {

    var id : Int?
    var recepieLink = [Int:String]()
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recepieImageView: UIImageView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var recepieButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    @IBAction func prepareToLeave(_ sender: UIButton) {
        leaveApp(url: recepieLink[sender.tag]!)
    }
    
    func leaveApp(url : String){
        UIApplication.shared.openURL(URL(string: url)!)
        
        
    }
}
