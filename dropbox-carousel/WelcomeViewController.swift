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
        
        imageOne.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -85,     // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -280,    // Y Move
                r2Max: 0)
        )
        
        imageOne.transform = CGAffineTransformRotate(imageOne.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -10,     // Rotation
                r2Max: 0)
            ) * M_PI / 180))
        
        
        imageTwo.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 40,      // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -260,    // Y Move
                r2Max: 0)
        )
        
        imageTwo.transform = CGAffineTransformScale(imageTwo.transform, scaleAmount, scaleAmount)
        
        imageTwo.transform = CGAffineTransformRotate(imageTwo.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -10,     // Rotation
                r2Max: 0)
                ) * M_PI / 180))

        
        
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
