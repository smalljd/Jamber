//
//  BorderedImageView.swift
//  Jamber
//
//  Created by Jeff on 11/24/18.
//  Copyright © 2018 Jeff Small. All rights reserved.
//

import UIKit

@IBDesignable
class BorderedImageView: UIImageView {
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            if let cgColor = layer.borderColor {
                return UIColor(cgColor: cgColor)
            } else {
                return nil
            }
        }
        set {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
