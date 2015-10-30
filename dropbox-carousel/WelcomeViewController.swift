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
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let scaleAmount = convertValue(scrollView.contentOffset.y, r1Min: -20.0, r1Max: 568.0, r2Min: 2.0, r2Max: 1.0)
        
        let imageOneXmin = -85
        let imageOneYmin = -280
        
        imageOne.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: CGFloat(imageOneXmin),     // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: CGFloat(imageOneYmin),    // Y Move
                r2Max: 0)
        )

        if imageOne.transform.ty < CGFloat(imageOneYmin) || imageOne.transform.tx < CGFloat(imageOneXmin)  {
            imageOne.transform.ty = CGFloat(imageOneYmin)
            imageOne.transform.tx = CGFloat(imageOneXmin)
        }
        
        if imageOne.transform.ty > 0 || imageOne.transform.tx > 0  {
            imageOne.transform.ty = 0
            imageOne.transform.tx = 0
        }
        
        imageOne.transform = CGAffineTransformScale(imageOne.transform, 1, 1)
        
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
        
        if imageTwo.transform.ty > 0 || imageTwo.transform.tx < 0 {
            imageTwo.transform.ty = 0
            imageTwo.transform.tx = 0
        }
        
        imageTwo.transform = CGAffineTransformScale(imageTwo.transform, scaleAmount, scaleAmount)
        
        imageTwo.transform = CGAffineTransformRotate(imageTwo.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -10,     // Rotation
                r2Max: 0)
                ) * M_PI / 180))
        
        
        
        imageThree.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 10,      // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -460,    // Y Move
                r2Max: 0)
        )
        
        if imageThree.transform.ty > 0 || imageThree.transform.tx < 0 {
            imageThree.transform.ty = 0
            imageThree.transform.tx = 0
        }
        
        imageThree.transform = CGAffineTransformScale(imageThree.transform, scaleAmount, scaleAmount)
        
        imageThree.transform = CGAffineTransformRotate(imageThree.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 10,     // Rotation
                r2Max: 0)
            ) * M_PI / 180))
        
        imageFour.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 90,      // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -410,    // Y Move
                r2Max: 0)
        )
        
        if imageFour.transform.ty > 0 || imageFour.transform.tx < 0 {
            imageFour.transform.ty = 0
            imageFour.transform.tx = 0
        }
        
        imageFour.transform = CGAffineTransformScale(imageFour.transform, scaleAmount, scaleAmount)
        
        imageFour.transform = CGAffineTransformRotate(imageFour.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 10,     // Rotation
                r2Max: 0)
            ) * M_PI / 180))
        
        imageFive.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -140,      // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -540,    // Y Move
                r2Max: 0)
        )
        
        if imageFive.transform.ty > 0 || imageFive.transform.tx > 0 {
            imageFive.transform.ty = 0
            imageFive.transform.tx = 0
        }
        
        imageFive.transform = CGAffineTransformScale(imageFive.transform, scaleAmount, scaleAmount)
        
        imageFive.transform = CGAffineTransformRotate(imageFive.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: 10,     // Rotation
                r2Max: 0)
            ) * M_PI / 180))
        
        imageSix.transform = CGAffineTransformMakeTranslation(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -120,      // X Move
                r2Max: 0),
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -530,    // Y Move
                r2Max: 0)
        )
        
        if imageSix.transform.ty > 0 || imageSix.transform.tx > 0 {
            imageSix.transform.ty = 0
            imageSix.transform.tx = 0
        }
        
        imageSix.transform = CGAffineTransformScale(imageSix.transform, scaleAmount, scaleAmount)
        
        imageSix.transform = CGAffineTransformRotate(imageSix.transform, CGFloat(Double(
            convertValue(scrollView.contentOffset.y,
                r1Min: -20.0,
                r1Max: 568.0,
                r2Min: -10,     // Rotation
                r2Max: 0)
            ) * M_PI / 180))
        
    }


}
