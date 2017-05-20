//
//  PastelUI.swift
//  Pods
//
//  Created by Kris Gellci on 5/19/17.
//
//

import UIKit

// View

open class PastelView: UIView, Pastelable {
    public var pastel = Pastel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPastel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPastel()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        pastel.frame = bounds
    }
}

// Button

open class PastelButton: UIButton, Pastelable {
    public var pastel = Pastel()
    public var maskToText = false {
        didSet {
            if maskToText {
                self.maskToImage = false
                self.mask = self.titleLabel
            } else {
                self.mask = nil
            }
        }
    }
    public var maskToImage = false {
        didSet {
            if maskToText {
                self.maskToText = false
                self.mask = self.imageView
            } else {
                self.mask = nil
            }
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPastel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPastel()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        pastel.frame = bounds
    }
}

// Label

open class PastelLabel: UILabel, Pastelable {
    public var pastel = Pastel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPastel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPastel()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        pastel.frame = bounds
    }
}

// TextField

open class PastelTextfield: UITextField, Pastelable {
    public var pastel = Pastel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupPastel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPastel()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        pastel.frame = bounds
    }
}

// TextView

open class PastelTextView: UITextView, Pastelable {
    public var pastel = Pastel()
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        setupPastel()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPastel()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        pastel.frame = bounds
    }
}
