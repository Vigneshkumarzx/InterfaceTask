//
//  CornerRadius+Extension.swift
//  InterfaceTask
//
//  Created by vignesh kumar c on 02/02/22.
//

import Foundation
import UIKit


extension UIView {
  @IBInspectable  var cornerRadius: CGFloat {
        get {
            return cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

