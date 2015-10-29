//
//  SignInViewController.swift
//  dropbox-carousel
//
//  Created by Andy Taylor on 10/27/15.
//  Copyright © 2015 Andy Taylor. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var emailInput: UITextField!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var hideTextBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        
        scrollView.delegate = self
        
        hideTextBox.alpha = 0
        scrollView.bounces = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        scrollView.contentOffset.y = 90
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -100)
        scrollView.bounces = true
        scrollView.scrollEnabled = true
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        scrollView.contentOffset.y = 0
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, 0)
        scrollView.bounces = false
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(self.scrollView.contentOffset)
        
        if scrollView.contentOffset.y <= 50.0 {
            view.endEditing(true)
        }
    }
    
    @IBAction func tapBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func FocusInput(sender: AnyObject) {
        
    }
    
    @IBAction func tapBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func tapSignInButton(sender: AnyObject) {
        if emailInput.text == "" || passwordInput.text == "" {
            
            let alertController = UIAlertController(title: "Can't Log In", message: "Both email and password are required.", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in }

            alertController.addAction(cancelAction)
            
            presentViewController(alertController, animated: true) { }
            
        } else {
            if emailInput.text != "hi@andytaylor.me" || passwordInput.text != "derp" {
                
                activityIndicator.startAnimating()
                hideTextBox.alpha = 1
                
                delay(2) {
                    self.activityIndicator.stopAnimating()
                    self.hideTextBox.alpha = 0
                    
                    let alertController = UIAlertController(title: "Can't Log In", message: "Ur email or password is prolly wrong.", preferredStyle: .Alert)
                    
                    let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in }
                    
                    alertController.addAction(cancelAction)
                    
                    self.presentViewController(alertController, animated: true) { }
                }
            }
            
            if emailInput.text == "hi@andytaylor.me" && passwordInput.text == "derp" {
                
                activityIndicator.startAnimating()
                hideTextBox.alpha = 1
                
                delay(2) {
                    self.performSegueWithIdentifier("SignIn", sender: nil)
                }
                
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
