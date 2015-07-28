//
//  ViewController.swift
//  guessNumber
//
//  Created by Anastasiia Staiko on 6/20/15.
//  Copyright (c) 2015 Anastasiia Staiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet var message: UILabel!
    @IBOutlet var enterYourNumber: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    // iVars
    
    var number: Int!
    var numberEntered: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        imageView.alpha = 1
        
        message.text = "Guess a number between 1 and 100"
        
        // Random number
        
        number = Int(arc4random_uniform(100)) + 1
        println("number: \(number)")
   
    }
   
    @IBAction func reset(sender: UIButton) {
        
        number = Int(arc4random_uniform(100) + 1)
        println("New Random Number is: \(number)")
        message.text = "New Game!"
        enterYourNumber.text = ""
        imageView.alpha = 1
    }
  
        @IBAction func guess(sender: UIButton) {
          
        var numberEntered = enterYourNumber.text.toInt()
      
                if numberEntered != nil {
        
                    if numberEntered > number &&
                       numberEntered < 100 {
                
                        message.text = "Your number is too high"
                        message.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        message.font = UIFont.systemFontOfSize(20)
                    
                    } else if numberEntered == number {
            
                        message.text = "Congratulations, you won!"
                        message.textColor = UIColor(red: 1.0, green: 0.5, blue: 0, alpha: 1)
                        message.font = UIFont.boldSystemFontOfSize(27)
                        
                        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: nil, animations: {
                            self.message.center = CGPoint(x: 100, y: 40 + 200)
                            
                        }, completion: nil)
                      
                    } else if numberEntered < number &&
                              numberEntered > 0 {
               
                        message.text = "Your number if too low"
                        message.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        message.font = UIFont.systemFontOfSize(20)
        
                    } else if numberEntered == 0 ||
                              numberEntered > 100 ||
                              numberEntered < 0 {
        
                        message.text = "Only numbers from 1 to 100, please!"
                        message.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        message.font = UIFont.systemFontOfSize(20)
                        
                    } else {
                        
                        println("Please enter a new number!")
                        message.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
                        message.font = UIFont.systemFontOfSize(20)
                    }
                    
                }
            
            }
    
       // Makes the keyboard disappear when tapped on the background aria.
    
           override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
           enterYourNumber.resignFirstResponder()
           self.view.endEditing(true) }
    
}





