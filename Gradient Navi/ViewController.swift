//
//  ViewController.swift
//  Gradient Navi
//
//  Created by Tien Tran on 4/2/19.
//  Copyright © 2019 Tien Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addingGradientLayerToNavigationBar([#colorLiteral(red: 0.9254901961, green: 0.1098039216, blue: 0.1411764706, alpha: 1).cgColor, #colorLiteral(red: 0.1607843137, green: 0.5098039216, blue: 0.5764705882, alpha: 1).cgColor])
    }
    
    /// Add Gradients colors to Navigation with colors Array
    ///
    /// - Parameter colorsArray: The Array has color array inside, should put each item from left to right
    func addingGradientLayerToNavigationBar(_ colorsArray: Array<Any>) {
        
        let currentNaviBar = navigationController?.navigationBar
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = (currentNaviBar?.bounds)!
        gradientLayer.colors = colorsArray
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 0)
        let gradientImage = UIImage.imageWithLayer(layer: gradientLayer)
        
        currentNaviBar?.setBackgroundImage(gradientImage, for: .default)
    }
}

extension UIImage {
    class func imageWithLayer(layer: CALayer) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.isOpaque, 0.0)
        layer.render(in:UIGraphicsGetCurrentContext()!)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}

