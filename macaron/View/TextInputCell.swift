//
//  TextInputCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class TextInputCell: MacaronCell, MacaronInputCellType {
    public var valuePointer: UnsafeMutablePointer<String>!

    public typealias T = String
    
    @IBOutlet weak public var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    public var value: String {
        get {
            return textField.text ?? ""
        } set {
            textField.text = newValue
        }
    }

    public func getRowHeight() -> CGFloat {
        return 50
    }
}
