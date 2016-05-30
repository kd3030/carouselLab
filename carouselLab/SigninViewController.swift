//
//  SigninViewController.swift
//  carouselLab
//
//  Created by Kunal Desai on 5/27/16.
//  Copyright © 2016 Kunal Desai. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    
    @IBOutlet weak var carouselTextView: UIImageView!
    
    @IBOutlet weak var signupParentView: UIView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    // define variables
    var initialFieldY: CGFloat!
    var initialParentY: CGFloat!
    var initialCarouselY: CGFloat!
    var offset: CGFloat!
    var offsetSignup: CGFloat!
    var offsetCarousel: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name:UIKeyboardWillHideNotification, object: nil)
        
        
        initialFieldY = fieldParentView.frame.origin.y
        initialParentY = signupParentView.frame.origin.y
        initialCarouselY = carouselTextView.frame.origin.y
        offset = -200
        offsetSignup = -70
        offsetCarousel = -65
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
    func keyboardWillShow(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialFieldY + offset
        signupParentView.frame.origin.y = initialParentY + offsetSignup
        carouselTextView.frame.origin.y = initialCarouselY + offsetCarousel
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        
        fieldParentView.frame.origin.y = initialFieldY
        signupParentView.frame.origin.y = initialParentY
        carouselTextView.frame.origin.y = initialCarouselY
       

        
    }

    
    @IBAction func didTap(sender: AnyObject) {
        
        view.endEditing(true)
        
    }
    
    
    @IBAction func didPressLogin(sender: AnyObject) {
        
        
        
        // Start animating the activity indicator
       loginIndicator.startAnimating()
        // Set the Button state to "Selected"
        loginButton.selected = true


       // let alertController = UIAlertController(title: "Hey AppCoda", message: "What do you want to do?", preferredStyle: .Alert)
        
      //  presentViewController(alertController, animated: true, completion: nil)
 
        // if either email and password field is empty
        
        
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
        
            // Stop animating the activity indicator.
            self.loginIndicator.stopAnimating()
            
            let alertController = UIAlertController(title: "Email required", message: "Please enter your email address?", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
          presentViewController(alertController, animated: true, completion: nil)

            }
        
        
    else {
       
        // If both the email and password fields match what we are looking for...
        
        if emailField.text == "kunal" && passwordField.text == "password" {
            // Delay for 2 second.
            delay(2, closure: { () -> () in
                // Stop animating the activity indicator.
              self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // perform the Segue to the next screen.
                self.performSegueWithIdentifier("yourSegue", sender: nil)
            })
            // Otherwise, email or password are incorrect so...
        } else {
            
            
        
            
            
            // Delay for 2 second
            delay(2, closure: { () -> () in
                
                
                
                // Stop animating the activity indicator.
                self.loginIndicator.stopAnimating()
                // Set the button state back to default, "Not Selected".
                self.loginButton.selected = false
                // Create and Show UIAlertController...see guide, Using UIAlertController
                
                let alertController = UIAlertController(title: "Invalid Email or Password", message: "Please enter a valid email and password", preferredStyle: .Alert)
                
               /* let logoutAction = UIAlertAction(title: "Cancel", style: .Destructive) { (action) in
                    // handle case of user logging out
                }
                // add the logout action to the alert controller
                alertController.addAction(logoutAction)
                */
                
                let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in
                    // handle case of user canceling. Doing nothing will dismiss the view.
                }
                // add the cancel action to the alert controller
                alertController.addAction(cancelAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            })
        
        
        
    }

            
        } // outer else
    } // for the button
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
