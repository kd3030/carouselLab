//
//  IntroScrollViewController.swift
//  carouselLab
//
//  Created by Kunal Desai on 5/28/16.
//  Copyright © 2016 Kunal Desai. All rights reserved.
//

import UIKit

class IntroScrollViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = (imageView.image?.size)!
   //     scrollView.delegate = self

     //   scrollView.contentSize = CGSize(width: 320, height: 1136)
        
        // Do any additional setup after loading the view.
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
