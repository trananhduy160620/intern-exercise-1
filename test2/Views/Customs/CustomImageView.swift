//
//  CustomImageView.swift
//  test2
//
//  Created by duytran on 9/28/21.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius

        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var imageColor: UIColor = UIColor.white {
        didSet {
            self.image = self.image?.withTintColor(imageColor, renderingMode: .alwaysOriginal)
        }
    }
}
