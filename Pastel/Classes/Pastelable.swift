//
//  Pastelable.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit

@objc
public enum PastelPoint: Int {
    case left
    case top
    case right
    case bottom
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    
    var point: CGPoint {
        switch self {
        case .left: return CGPoint(x: 0.0, y: 0.5)
        case .top: return CGPoint(x: 0.5, y: 0.0)
        case .right: return CGPoint(x: 1.0, y: 0.5)
        case .bottom: return CGPoint(x: 0.5, y: 1.0)
        case .topLeft: return CGPoint(x: 0.0, y: 0.0)
        case .topRight: return CGPoint(x: 1.0, y: 0.0)
        case .bottomLeft: return CGPoint(x: 0.0, y: 1.0)
        case .bottomRight: return CGPoint(x: 1.0, y: 1.0)
        }
    }
}

public protocol Pastelable {
    var pastel: Pastel { get }
    var layer: CALayer { get }
    var frame: CGRect { get }
    
    func addColor(_ color: UIColor)
    func setColors(_ colors: [UIColor])
    func setColors(gradient: PastelGradient)
    
    func start(pastelPoint: PastelPoint)
    func end(pastelPoint: PastelPoint)
    func start(customPoint: CGPoint)
    func end(customPoint: CGPoint)
    
    func animationDuration(_ duration: TimeInterval)
    func startAnimation()
}

public extension Pastelable {
    func setupPastel() {
        pastel.frame = frame
        layer.insertSublayer(pastel, at: 0)
    }
    
    public func addColor(_ color: UIColor) {
        pastel.gradientColors.append(color)
        pastel.startAnimation()
    }
    
    public func setColors(_ colors: [UIColor]) {
        guard colors.count > 0 else { return }
        pastel.gradientColors = colors
        pastel.startAnimation()
    }
    
    public func setColors(gradient: PastelGradient) {
        setColors(gradient.colors())
    }
    
    public func start(pastelPoint: PastelPoint) {
        pastel.startPoint = pastelPoint.point
    }
    
    public func end(pastelPoint: PastelPoint) {
        pastel.endPoint = pastelPoint.point
    }
    
    public func start(customPoint: CGPoint) {
        pastel.startPoint = customPoint
    }
    
    public func end(customPoint: CGPoint) {
        pastel.endPoint = customPoint
    }
    
    public func animationDuration(_ duration: TimeInterval) {
        pastel.animationDuration = duration
    }
    
    public func startAnimation() {
        pastel.startAnimation()
    }
}
