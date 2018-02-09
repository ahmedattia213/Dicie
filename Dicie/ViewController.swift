//
//  ViewController.swift
//  Dicie
//
//  Created by Ahmed Amr on 1/18/18.
//  Copyright © 2018 Ahmed Amr. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    var randomDiceNum1 : Int = 0
    var randomDiceNum2 : Int = 0
    
    var woahSound = AVAudioPlayer()
    var shakeSound = AVAudioPlayer()
    var hitSound = AVAudioPlayer()
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            hitSound = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "diceThrow" , ofType: "wav")!))
            woahSound = try! AVAudioPlayer(contentsOf : URL.init(fileURLWithPath: Bundle.main.path(forResource: "woah" , ofType: "wav")!))
            shakeSound = try! AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "diceShake" , ofType: "wav")!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
            hitSound.prepareToPlay()
            hitSound.play()
            updateDiceImages()
           
            if diceImageView1.image == #imageLiteral(resourceName: "dice6") && diceImageView2.image == #imageLiteral(resourceName: "dice6") {
                woahSound.prepareToPlay()
                woahSound.play()     // lucky
            }
        }
        
    
    
    func updateDiceImages(){
        randomDiceNum1 = Int(arc4random_uniform(6)+1)
        randomDiceNum2 = Int(arc4random_uniform(6)+1)
        diceImageView1.image = UIImage(named: "dice\(randomDiceNum1)")
        diceImageView2.image = UIImage(named: "dice\(randomDiceNum2)")
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        shakeSound.stop()
        updateDiceImages()
        
        hitSound.prepareToPlay()
        hitSound.play()
    }
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        shakeSound.prepareToPlay()
        shakeSound.play()
    }
    
}















