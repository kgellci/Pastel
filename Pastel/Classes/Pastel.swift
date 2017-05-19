//
//  Pastel.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit

open class Pastel: CAGradientLayer {
    private struct Animation {
        static let keyPath = "colors"
        static let key = "ColorChange"
    }
    
    // Custom Duration
    var animationDuration: TimeInterval = 5.0
    
    private var currentGradient: Int = 0
    
    var gradientColors: [UIColor] = [UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                                     UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                                     UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                                     UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                                     UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                                     UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                                     UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)]
 
    
    public override init() {
        super.init()
        initialSetup()
    }
    
    public override init(layer: Any) {
        super.init(layer: layer)
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialSetup()
    }
    
    private func initialSetup() {
        startPoint = PastelPoint.topRight.point
        endPoint = PastelPoint.bottomLeft.point
    }

    func startAnimation() {
        removeAllAnimations()
        setup()
        animateGradient()
    }
    
    
    fileprivate func setup() {
        colors = currentGradientSet()
        drawsAsynchronously = true
    }
    
    fileprivate func currentGradientSet() -> [CGColor] {
        guard gradientColors.count > 0 else { return [] }
        return [gradientColors[currentGradient % gradientColors.count].cgColor,
                gradientColors[(currentGradient + 1) % gradientColors.count].cgColor]
    }
    
    public func addcolor(_ color: UIColor) {
        colors?.append(color)
    }
    
    func animateGradient() {
        currentGradient += 1
        let animation = CABasicAnimation(keyPath: Animation.keyPath)
        animation.duration = animationDuration
        animation.toValue = currentGradientSet()
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        add(animation, forKey: Animation.key)
    }
    
    override open func removeFromSuperlayer() {
        super.removeFromSuperlayer()
        removeAllAnimations()
    }
}

extension Pastel: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            colors = currentGradientSet()
            animateGradient()
        }
    }
}

