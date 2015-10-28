//
//  WelcomeViewController.swift
//  dropbox-carousel
//
//  Created by Andy Taylor on 10/27/15.
//  Copyright © 2015 Andy Taylor. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var imageTwo: UIImageView!
    
    @IBOutlet weak var imageThree: UIImageView!
    
    @IBOutlet weak var imageFour: UIImageView!
    
    @IBOutlet weak var imageFive: UIImageView!
    
    @IBOutlet weak var imageSix: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = imageView.frame.size
        
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSignInButton(sender: AnyObject) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        let scaleAmount = convertValue(scrollView.contentOffset.y, r1Min: -20.0, r1Max: 568.0, r2Min: 2.0, r2Max: 1)
        
        imageThree.transform = CGAffineTransformMakeScale(scaleAmount, scaleAmount)
        imageFour.transform = CGAffineTransformMakeScale(scaleAmount, scaleAmount)
        imageFive.transform = CGAffineTransformMakeScale(scaleAmount, scaleAmount)
        imageSix.transform = CGAffineTransformMakeScale(scaleAmount, scaleAmount)
        
        imageOne.transform = CGAffineTransformMakeTranslation(0,
            // Y Move
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -300,    // Top
                r2Max: 0)       // Bottom
        )
        
        imageTwo.transform = CGAffineTransformMakeScale(scaleAmount, scaleAmount)
        
        imageTwo.transform = CGAffineTransformMakeTranslation(0,
            // Y Move
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -300,    // Top
                r2Max: 0)       // Bottom
        )
        
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
