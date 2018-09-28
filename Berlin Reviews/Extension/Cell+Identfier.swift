//
//  Cell+Identfier.swift
//  Berlin Reviews
//
//  Created by Attia Mo on 9/3/18.
//  Copyright © 2018 Attia Mo. All rights reserved.
//

import Foundation

protocol ReusableCellView: class {
    static var id: String {get}
}

extension ReusableCellView {
    static var id: String {
        return "\(self)Resuable"
    }
}
