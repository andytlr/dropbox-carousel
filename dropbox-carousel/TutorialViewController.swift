//
//  TutorialViewController.swift
//  dropbox-carousel
//
//  Created by Andy Taylor on 10/28/15.
//  Copyright © 2015 Andy Taylor. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    func updatePage() {
        let offset = scrollView.contentOffset.x / scrollView.frame.size.width
        let pageIndex = Int(offset)
        pageControl.currentPage = pageIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scrollView.delegate = self
        
        scrollView.contentSize = CGSize(width:1280, height:568)
        
        updatePage()
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        updatePage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
