//
//  ProfileViewController.swift
//  tinder
//
//  Created by emersonmalca on 11/10/16.
//  Copyright © 2016 Emerson Malca. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func present(fromImageView: UIImageView, completion: ((Bool) -> Swift.Void)? = nil) {
        
        // Hide our image view during transition
        imageView.isHidden = true
        
        // Not show our interface
        
        // Copy image view
        let tempImageView = UIImageView(image: fromImageView.image)
        tempImageView.contentMode = fromImageView.contentMode
        let window = UIApplication.shared.delegate?.window!
        tempImageView.frame = fromImageView.convert(fromImageView.bounds, to: window)
        window?.addSubview(tempImageView)
        
        // Calculate new scale
        let scale = imageView.bounds.size.width / tempImageView.bounds.size.width
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0.75, options: .curveEaseOut, animations: {
            tempImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        }, completion: completion)
    }
    

}
