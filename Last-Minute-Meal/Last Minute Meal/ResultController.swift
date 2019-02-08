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

class ResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var recepieTableView: UITableView!
    
    
    
    var delegate : CanRecive?
    var recepies = [RecepieModel]()
    var recepieLinks = [Int : String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recepieTableView.delegate = self
        recepieTableView.dataSource = self
        recepieTableView.register(UINib(nibName: "RecepieCell",bundle: nil), forCellReuseIdentifier: "recepieCell")
        configureTableview()
        recepieTableView.separatorStyle = .none

       
    }
    
    @IBAction func returnToSearch(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recepies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recepieCell", for: indexPath) as! RecepieCell
        
        cell.recepieLink[recepies[indexPath.row].id] = recepies[indexPath.row].recepieURL
        cell.recepieButton.tag = recepies[indexPath.row].id
        
        cell.title.text = recepies[indexPath.row].name
        
        cell.ingredientsLabel.text = "Ingredients: \(String(recepies[indexPath.row].usedIngredients)) / \(String(recepies[indexPath.row].maxIngredients))"
        
        cell.recepieImageView.image = recepies[indexPath.row].recepieImage
        return cell
    }
    func configureTableview() {
        recepieTableView.rowHeight = 150
        recepieTableView.estimatedRowHeight = 150.0
    }
}
