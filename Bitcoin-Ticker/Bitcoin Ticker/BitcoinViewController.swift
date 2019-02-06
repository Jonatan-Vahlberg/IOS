//
//  BitcoinViewController.swift
//  Bitcoin Ticker
//
//  Created by ZOG-II on 2019-02-03.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit

protocol CanReceive {
    func received()
}

class BitcoinViewController: UIViewController {
    var delegate: CanReceive?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goBack(){
        
        self.dismiss(animated: true, completion: nil)
    }

    
    

    

}
