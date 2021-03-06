//
//  ViewController.swift
//  GSSimpleImage
//
//  Created by William Hu on 01/16/2016.
//  Copyright (c) 2016 William Hu. All rights reserved.
//

import UIKit
import GSSimpleImage

class ViewController: UIViewController, GSSimpleImageViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = GSSimpleImageView(frame: CGRectMake(20, 100, 200, 200))
        imageView.image = UIImage(named: "test2.png")
        imageView.delegate = self
        self.view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(sender: AnyObject) {
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
}

