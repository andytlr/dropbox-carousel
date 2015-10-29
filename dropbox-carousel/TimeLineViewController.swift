//
//  TimeLineViewController.swift
//  dropbox-carousel
//
//  Created by Andy Taylor on 10/28/15.
//  Copyright © 2015 Andy Taylor. All rights reserved.
//

import UIKit

class TimeLineViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = imageView.frame.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSpeechBubble(sender: AnyObject) {
        
    }

    @IBAction func tapTimsFace(sender: AnyObject) {
        
    }

}
