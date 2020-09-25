//
//  LottieLoader.swift
//  Lottie_Loader
//
//  Created by Kishan Ravindra on 25/09/20.
//  Copyright © 2020 Kishan Ravindra. All rights reserved.
//

import UIKit
import Lottie

open class LottieLoader {
    static let shared = LottieLoader()
    
    let blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .systemThinMaterialDark)
        let view = UIVisualEffectView(effect: blurEffect)
        let window = UIWindow(frame: UIScreen.main.bounds)
        view.frame = window.frame
        view.center = window.center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var animationLoaderView: UIView = {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        view.center = window.center
        view.backgroundColor = UIColor.white
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        return view
    }()
    
    
    private var animationView: AnimationView?
    
    open func showLoaderAnimation(parentView: UIViewController) {
        animationView = .init(name: "beer_shake") // Change your lottie image/json here
        animationView!.frame = CGRect(x: 0, y: 0, width: animationLoaderView.frame.width, height: animationLoaderView.frame.height)
        animationView!.contentMode = .scaleAspectFit
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 0.5
        animationLoaderView.addSubview(animationView!)
        animationView!.play()
        
        blurEffectView.contentView.addSubview(animationLoaderView)
        parentView.view.addSubview(blurEffectView)
    }
    
    open func hideLoaderAnimation() {
        animationView!.stop()
        blurEffectView.removeFromSuperview()
    }
}
