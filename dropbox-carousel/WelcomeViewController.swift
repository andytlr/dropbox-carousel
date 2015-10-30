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
        
        let scrollMin = -20.0
        let scrollMax = 568.0
        let scaleMax = 1
        
        // Won't need this forever
        let scaleAmount = convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: 2.0, r2Max: 1.0)
        
        let images = [imageOne]
        let xMin = [-85]
        let yMin = [-280]
        let scaleMin = [1]
        let rotation = [-10]
        
        for (index, image) in images.enumerate() {
            
            image.transform = CGAffineTransformMakeTranslation(
                convertValue(scrollView.contentOffset.y,
                    r1Min: CGFloat(scrollMin),
                    r1Max: CGFloat(scrollMax),
                    r2Min: CGFloat(xMin[index]),     // X Move
                    r2Max: 0),
                convertValue(scrollView.contentOffset.y,
                    r1Min: CGFloat(scrollMin),
                    r1Max: CGFloat(scrollMax),
                    r2Min: CGFloat(yMin[index]),    // Y Move
                    r2Max: 0)
            )
            
            if yMin[index] < 0 {
                if image.transform.ty < CGFloat(yMin[index])  {
                    image.transform.ty = CGFloat(yMin[index])
                    image.transform.tx = CGFloat(xMin[index])
                }
                
                if image.transform.ty > 0  {
                    image.transform.ty = 0
                    image.transform.tx = 0
                }
            } else {
                if image.transform.ty > CGFloat(yMin[index])  {
                    image.transform.ty = CGFloat(yMin[index])
                    image.transform.tx = CGFloat(xMin[index])
                }
                
                if image.transform.ty < 0  {
                    image.transform.ty = 0
                    image.transform.tx = 0
                }
            }
            
            if xMin[index] < 0 {
                if image.transform.tx < CGFloat(xMin[index]) {
                    image.transform.ty = CGFloat(yMin[index])
                    image.transform.tx = CGFloat(xMin[index])
                }
                
                if image.transform.tx > 0 {
                    image.transform.ty = 0
                    image.transform.tx = 0
                }
            } else {
                if image.transform.tx > CGFloat(xMin[index]) {
                    image.transform.ty = CGFloat(yMin[index])
                    image.transform.tx = CGFloat(xMin[index])
                }
                
                if image.transform.tx < 0 {
                    image.transform.ty = 0
                    image.transform.tx = 0
                }
            }
            
            image.transform = CGAffineTransformScale(image.transform,
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(scaleMin[index]), r2Max: CGFloat(scaleMax)),
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(scaleMin[index]), r2Max: CGFloat(scaleMax))
            )
            
            image.transform = CGAffineTransformRotate(image.transform, CGFloat(Double(
                convertValue(scrollView.contentOffset.y,
                    r1Min: CGFloat(scrollMin),
                    r1Max: CGFloat(scrollMax),
                    r2Min: CGFloat(rotation[index]),     // Rotation
                    r2Max: 0)
                ) * M_PI / 180))
        } // end of for loop
        
        
        
        
        
        
        
        
        
        
        
        
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
