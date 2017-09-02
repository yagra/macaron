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
    private var data: StringInputCellData!

    public func getRowHeight() -> CGFloat {
        return 42
    }

    @IBAction func textFieldEditingChanged(_ sender: Any) {
        data.value.value = textField.text ?? ""
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? StringInputCellData {
            self.data = data
            textField.isSecureTextEntry = data.secret
            label.text = data.labelText
            textField.placeholder = data.placeholder
        }
    }
}

public class StringInputCellData: MacaronInputCellData<StringInputCell, StringValue> {
    var placeholder: String
    var secret: Bool

    public init(labelText: String, placeholder: String, value: StringValue, secret: Bool=false) {
        self.placeholder = placeholder
        self.secret = secret
        super.init(labelText: labelText, value: value)
    }
}
