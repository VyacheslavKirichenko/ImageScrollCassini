//
//  ImageViewController.swift
//  ImageScroll
//
//  Created by VyacheslavKrivoi on 4/21/19.
//  Copyright © 2019 VyacheslavKrivoi. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    var imageURL:URL? {
        didSet	{
            image = nil
            
            if view.window != nil {
            fetchImage()
            }
            
        }
    }
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
        
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.minimumZoomScale = 1/15
            scrollView.maximumZoomScale = 1
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    

       var imageView = UIImageView()
    
    
    func fetchImage() {
        if let url = imageURL {
        
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                image = UIImage(data:imageData)
                
            }
                
            }
            
        }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil{
            imageURL = DemoURLs.downloadImage
        }
    }
}
