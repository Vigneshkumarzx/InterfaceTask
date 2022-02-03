//
//  Lbel+Extension.swift
//  InterfaceTask
//
//  Created by vignesh kumar c on 03/02/22.
//

import Foundation
import UIKit

@IBDesignable
class CustomLabel: UILabel {
    
 @IBInspectable var borderColor: UIColor = UIColor.green {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

}
