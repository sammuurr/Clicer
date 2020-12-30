//
//  ShopViewController.swift
//  Clicer
//
//  Created by ADMIMN on 29.12.2020.
//

import UIKit

class ShopViewController: UIViewController {

    
    @IBOutlet var sahter: UIButton!
    @IBOutlet var fabrika: UIButton!
    @IBOutlet var zavod: UIButton!
    let userDefaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = userDefaults.integer(forKey: "sahter")
        let b = userDefaults.integer(forKey: "fabrika")
        let c = userDefaults.integer(forKey: "zavod")
        
        if a != 0{
            sahter.setTitle("\(a)$", for: .normal)
        }
        if b != 0{
            fabrika.setTitle("\(b)$", for: .normal)
        }
        if c != 0{
            zavod.setTitle("\(c)$", for: .normal)
        }
        
    }
    
    @IBAction func shoppedButton(_ sender: UIButton) {
        
        var priceS = userDefaults.integer(forKey: "sahter")
        var priceF = userDefaults.integer(forKey: "fabrika")
        var priceZ = userDefaults.integer(forKey: "zavod")
        if priceS == 0{
            priceS = 50
            userDefaults.set(priceS, forKey: "sahter")
        }
        if priceF == 0{
            priceF = 150
            userDefaults.set(priceF, forKey: "fabrika")
        }
        if priceZ == 0{
            priceZ = 4500
            userDefaults.set(priceZ, forKey: "zavod")
        }
        
        
        
        if sender.tag == 0{
            if coins >= priceS {
                coins = coins - priceS
                
                priceS = priceS * 2
                sahter.setTitle("\(priceS)$", for: .normal)
                userDefaults.set(priceS, forKey: "sahter")
                
                autoTap = autoTap + 5
                userDefaults.set(autoTap, forKey: "autoTap")
            }
            
        }else if sender.tag == 1{
            
            if coins >= priceF {
                coins = coins - priceF
                
                priceF = priceF * 2
                fabrika.setTitle("\(priceF)$", for: .normal)
                userDefaults.set(priceF, forKey: "fabrika")
                
                autoTap = autoTap + 15
                userDefaults.set(autoTap, forKey: "autoTap")
            }
            
        }else if sender.tag == 2{
            if coins >= priceZ {
                coins = coins - priceZ
                
                priceZ = priceZ * 2
                zavod.setTitle("\(priceZ)$", for: .normal)
                userDefaults.set(priceF, forKey: "zavod")
            
                autoTap = autoTap + 140
                userDefaults.set(autoTap, forKey: "autoTap")
            }
            
        }
        
    }
    
}
