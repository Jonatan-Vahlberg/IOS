//
//  ViewController.swift
//  Bitcoin Ticker
//
//  Created by ZOG-II on 2019-02-02.
//  Copyright © 2019 Jonatan Vahlberg. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CanReceive{
    
    func received() {
        //BlankMethod
    }
    

    //URL and API KEY
    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    var finalURL : String = ""
    var bitcoinValue : String = ""
    var currencySymbol : String = ""
    //UI Variables
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var bitcoinButton: UIButton!
    
    
    
    //Currency Array
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    let currencySymbolDictionary : [String: String] = ["AUD":"$", "BRL":"R$", "CAD":"$", "CNY":"¥", "EUR":"€", "GBP":"£", "HKD":"$", "IDR":"Rp", "ILS":"₪", "INR":"₹", "JPY":"¥", "MXN":"$", "NOK":"kr", "NZD":"$", "PLN":"zł", "RON":"lei", "RUB":"₽", "SEK":"kr", "SGD":"$", "USD":"$", "ZAR":"R"]
    
    //Protocol Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row,currencyArray[row])
        finalURL = baseURL + currencyArray[row]
        currencySymbol = currencySymbolDictionary[currencyArray[row]]!
        getBitcoinData(url : finalURL)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bitcoinButton.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        //Picker Delegate and dataSource
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    //MARK: - Networking
    //    /***************************************************************/
    func getBitcoinData(url: String){
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the bitcoin data")
                    let bitcoinJSON : JSON = JSON(response.result.value!)
                    self.updateBitcoinData(json: bitcoinJSON)
                    

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    
                }
            }    }
    

    //MARK: - JSON Parsing
    //    /***************************************************************/
    
    func updateBitcoinData(json: JSON){
        if let tempResult = json["ask"].double{
            bitcoinValue = String(tempResult)
            
            updateUIWithBitcoinValue()
        }
        else{
            priceLabel.text = "Price Unavailable"
        }
    }
    
    //MARK: - UI Update
    //    /***************************************************************/

    func updateUIWithBitcoinValue(){
        priceLabel.text = currencySymbol + " " +  bitcoinValue
    }
    @IBAction func buttonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goIntoBitcoin", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goIntoBitcoin"{
            let secondVC = segue.destination as! BitcoinViewController
        }
    }
    
    
}


