//
//  UIColor+.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/09/02.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    convenience init(hexString: String, alpha: CGFloat) {
        let range = NSMakeRange(0, hexString.characters.count)
        let hex = (hexString as NSString).replacingOccurrences(of: "[^0-9a-fA-F]", with: "", options: NSString.CompareOptions.regularExpression, range: range)
        var color: UInt32 = 0
        Scanner(string: hex).scanHexInt32(&color)
        self.init(hex: Int(color), alpha: alpha)
    }

    var image: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(self.cgColor)
        context!.fill(rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return img
    }
}
