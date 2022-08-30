//
//  ViewController.swift
//  Simon
//
//  Created by William Dedominico on 8/30/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    
    var pattern:[String] = [];
    var userIndex:Int = 0;
    var takingInput:Bool = true;
    
    var player : AVAudioPlayer!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        addToPattern()
    }
    
    @IBAction func greenPressed(_ sender: Any) {
        buttonPressed(color: "Green");
    }
    
    @IBAction func redPressed(_ sender: Any) {
        buttonPressed(color: "Red");
    }
    
    @IBAction func yellowPressed(_ sender: Any) {
        buttonPressed(color: "Yellow");
    }
    
    @IBAction func bluePressed(_ sender: Any) {
        buttonPressed(color: "Blue");
    }
    
    func buttonPressed(color:String) {
        if (takingInput) {
            if ( !(color == pattern[userIndex]) ) {
                lose();
            }
            else{userIndex+=1;}
        }
        if (userIndex >= pattern.count) {
            let url = Bundle.main.url(forResource: "win", withExtension: "wav")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            takingInput = false;
            userIndex=0;
            addToPattern();
            playPattern();
        }
    }
    
    func lose() {
        let url = Bundle.main.url(forResource: "lose", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        userIndex = 0;
        pattern = [];
        takingInput = true;
    }
    
    func playPattern() {
        for color in pattern {
            switch color {
                
            case "Green":
                greenButton.backgroundColor = UIColor.green
                let url = Bundle.main.url(forResource: "green", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                greenButton.backgroundColor = UIColor(red: 75/255.0,green:145/255.0,blue:77/255.0,alpha: 255/255.0);
                break
                
            case "Red":
                redButton.backgroundColor = UIColor.red
                let url = Bundle.main.url(forResource: "red", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                redButton.backgroundColor = UIColor(red: 196/255.0,green:1/255.0,blue:18/255.0,alpha: 255/255.0);
                break
                
            case "Yellow":
                yellowButton.backgroundColor = UIColor.yellow
                let url = Bundle.main.url(forResource: "yellow", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                yellowButton.backgroundColor = UIColor(red: 161/255.0,green:135/255.0,blue:47/255.0,alpha: 255/255.0);
                break
                
            case "Blue":
                blueButton.backgroundColor = UIColor.blue
                let url = Bundle.main.url(forResource: "blue", withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
                blueButton.backgroundColor = UIColor(red: 0/255.0,green:64/255.0,blue:158/255.0,alpha: 255/255.0);
                break
                
            default:
                break
            }
        }
    }


    func addToPattern() {
        
        let randomInt = Int.random(in: 1..<5)
        
        switch randomInt{
        case 1:
            pattern.append("Green")
        break
            
        case 2:
            pattern.append("Red")
        break
            
        case 3:
            pattern.append("Yellow")
        break
            
        case 4:
            pattern.append("Blue")
        break
            
        default:
        break
        }
    }
    

}

