//
//  StringInputCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class StringInputCell: MacaronCell, MacaronInputCellType {
    @IBOutlet weak public var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var labelWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldTopPaddingConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldBottomPaddingConstraint: NSLayoutConstraint!
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
            if let font = data.labelFont {
                label.font = font
            }
            label.text = data.labelText
            label.sizeToFit()
            if let labelWidth = data.labelWidth {
                labelWidthConstraint.constant = labelWidth
            } else {
                labelWidthConstraint.isActive = false
            }
            label.textAlignment = data.labelTextAlignment

            if let font = data.fieldFont {
                textField.font = font
            }
            textField.isSecureTextEntry = data.secret
            textField.placeholder = data.placeholder
            textField.sizeToFit()

            let componentHeight = max(textField.frame.height, label.frame.height)
            height = componentHeight + data.topMargin + data.bottomMargin
            textFieldTopPaddingConstraint.constant = componentHeight - textField.frame.height + data.topMargin
            textFieldBottomPaddingConstraint.constant = componentHeight - textField.frame.height + data.bottomMargin
        }
    }
}

public class StringInputCellData: MacaronInputCellData<StringInputCell, StringValue> {
    public var placeholder: String
    public var secret: Bool
    public var labelWidth: CGFloat?
    public var labelFont: UIFont?
    public var fieldFont: UIFont?
    public var topMargin: CGFloat
    public var bottomMargin: CGFloat
    public var labelTextAlignment: NSTextAlignment

    public init(labelText: String, placeholder: String="", value: StringValue,
                labelWidth: CGFloat?=nil, labelFont: UIFont?=nil,
                labelTextAlignment: NSTextAlignment=NSTextAlignment.left,
                fieldFont: UIFont?=nil, secret: Bool=false,
                topMargin: CGFloat=10.0, bottomMargin: CGFloat=10.0) {
        self.placeholder = placeholder
        self.secret = secret
        self.labelWidth = labelWidth
        self.labelFont = labelFont
        self.fieldFont = fieldFont
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
        self.labelTextAlignment = labelTextAlignment
        super.init(labelText: labelText, value: value)
    }
}
