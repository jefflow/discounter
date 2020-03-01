//
//  CustomButton.swift
//  Discounter
//
//  Created by Jeff Low on 2/29/20.
//  Copyright © 2020 Jeff Low. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

}
