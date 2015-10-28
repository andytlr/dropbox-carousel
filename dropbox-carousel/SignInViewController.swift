//
//  SignInViewController.swift
//  dropbox-carousel
//
//  Created by Andy Taylor on 10/27/15.
//  Copyright © 2015 Andy Taylor. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var fieldParentView: UIView!
    
    @IBOutlet weak var buttonParentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        scrollView.contentOffset.y = 90
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, -130)
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.transform = CGAffineTransformMakeTranslation(0, 0)
    }
    @IBAction func FocusInput(sender: AnyObject) {

    }
    
    @IBAction func tapBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func tapSignInButton(sender: AnyObject) {
        
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
