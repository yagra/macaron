//
//  StringInputCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class StringInputCell: MacaronCell, MacaronCellType {
    @IBOutlet weak public var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    private var height: CGFloat = 42
    private var data: StringInputCellData!

    public func getRowHeight() -> CGFloat {
        return height
    }

    @IBAction func textFieldEditingChanged(_ sender: Any) {
        data.value.value = textField.text ?? ""
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? StringInputCellData {
            self.data = data
            label.font ??= data.labelFont
            label.text = data.labelText
            label.sizeToFit()
            if let labelWidth = data.labelWidth {
                labelWidthConstraint.constant = labelWidth
            } else {
                labelWidthConstraint.isActive = false
            }
            label.textAlignment = data.labelTextAlignment

            textField.font ??= data.fieldFont
            textField.keyboardType = data.keyboardType
            textField.isSecureTextEntry = data.secret
            textField.placeholder = data.placeholder
            textField.sizeToFit()

            height = max(textField.frame.height, label.frame.height)
        }
    }
}

public class StringInputCellData: MacaronCellData<StringInputCell> {
    public var value: StringValue
    public var keyboardType: UIKeyboardType = UIKeyboardType.default
    public var labelText: String
    public var placeholder: String
    public var secret: Bool = false
    public var labelWidth: CGFloat?
    public var labelFont: UIFont?
    public var fieldFont: UIFont?
    public var labelTextAlignment: NSTextAlignment = .center

    public init(labelText: String="", placeholder: String="", value: StringValue) {
        self.labelText = labelText
        self.placeholder = placeholder
        self.value = value
    }
}
