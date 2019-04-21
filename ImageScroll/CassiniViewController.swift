//
//  CassiniViewController.swift
//  ImageScroll
//
//  Created by VyacheslavKrivoi on 4/21/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let url = DemoURLs.NASA[identifier]{
                let destination = segue.destination
                if destination is UINavigationController {
                }
                if let imageVC = segue.destination.contents as? ImageViewController{
                    imageVC.imageURL = url
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }            }
        }
    }

}
extension UIViewController	{
    var contents: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
