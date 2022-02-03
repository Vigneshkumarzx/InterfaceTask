//
//  Extension+String.swift
//  InterfaceTask
//
//  Created by vignesh kumar c on 02/02/22.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
