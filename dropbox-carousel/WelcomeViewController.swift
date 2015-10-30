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
        
        scrollView.contentSize = imageView.frame.size
        scrollView.delegate = self
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        let scrollMin       = -35.0 // resting state is -20. But subtracting 15 means the images can move past their resting state, but still have a hard end or a clamped value.
        let scrollMax       = 568.0
        let endScale        = 1
        
        let images          = [imageOne,  imageTwo, imageThree, imageFour,  imageFive,  imageSix]
        let xMin            = [-85,       40,       10,         90,         -140,       -120]
        let yMin            = [-295,      -275,     -475,       -425,       -555,       -545]
        let initialScale    = [1,         2,        2,          2,          2,          2]
        let rotation        = [-10,       -10,      10,         10,         10,         -10]
        
        for (index, image) in images.enumerate() {
            
            image.transform = CGAffineTransformMakeTranslation(
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(xMin[index]), r2Max: 0),
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(yMin[index]), r2Max: 0)
            )
            
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
            
            // yMin stuff isn't in a if < 0 conditional because all the values are negative: they're always moving from the bottom to the top.
            if image.transform.ty < CGFloat(yMin[index])  {
                image.transform.ty = CGFloat(yMin[index])
                image.transform.tx = CGFloat(xMin[index])
            }
            
            if image.transform.ty > 0  {
                image.transform.ty = 0
                image.transform.tx = 0
            }
            
            image.transform = CGAffineTransformScale(image.transform,
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(initialScale[index]), r2Max: CGFloat(endScale)),
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(initialScale[index]), r2Max: CGFloat(endScale))
            )
            
            image.transform = CGAffineTransformRotate(image.transform, CGFloat(Double(
                convertValue(scrollView.contentOffset.y, r1Min: CGFloat(scrollMin), r1Max: CGFloat(scrollMax), r2Min: CGFloat(rotation[index]), r2Max: 0)
            ) * M_PI / 180))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
