//
//  ViewController.swift
//  Lottie_Loader
//
//  Created by Kishan Ravindra on 25/09/20.
//  Copyright © 2020 Kishan Ravindra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        LottieLoader.shared.showLoaderAnimation(parentView: self)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            LottieLoader.shared.hideLoaderAnimation()
        }
    }
}

