//
//  ViewController.swift
//  Clicer
//
//  Created by ADMIMN on 29.12.2020.
//

import UIKit

var coins:Int = UserDefaults().integer(forKey: "coins")
var tap:Int = UserDefaults().integer(forKey: "tap")
var autoTap:Int = UserDefaults().integer(forKey: "autoTap")

class ViewController: UIViewController {
    
    @IBOutlet var tapperView: UIView!
    @IBOutlet var shopView: UIView!
    @IBOutlet var shopButton: UIButton!
    @IBOutlet var coinLabel: UILabel!
    @IBOutlet var tapCoinLabel: UILabel!
    @IBOutlet var autoMaining: UILabel!
    let userDefaults = UserDefaults()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if tap == 0 {tap = 1}
        
        timerFunc()
        
        coinLabel.text = String(coins)
        setTapCount(taps: tap)
        autoMaining.text = String(autoTap)
        
        shopView.layer.cornerRadius = 20
        tapperView.layer.cornerRadius = 200
        shopButton.layer.cornerRadius = 40
    }
    
    func timerFunc() {
        DispatchQueue.global(qos: .userInitiated).async { [self] in

            timer = Timer(timeInterval: 1, target: self, selector: #selector(mainig), userInfo: nil, repeats: true)
            
            RunLoop.current.add(timer!, forMode: .default)
            RunLoop.current.run()
        }
    }
    
    @objc func mainig(){
        
        coins += autoTap
        DispatchQueue.main.async { [self] in
            coinLabel.text = String(coins)
        }
        
    }
    
    func setTapCount(taps: Int) {
        
        tapCoinLabel.text = "+\(taps)"
        tap = taps

    }
    
    @IBAction func tapAddCoin(_ sender: UITapGestureRecognizer) {
        
        coins += tap
        coinLabel.text = String(coins)
    }
    
}

