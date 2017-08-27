//
//  TextInput.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class TextInputCell: MacaronCell, MacaronInputCellType {
    public typealias InputType = StringValue
    @IBOutlet weak public var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    private var data: TextInputCellData!

    public func getRowHeight() -> CGFloat {
        return 50
    }

    @IBAction func textFieldEditingDidEnd(_ sender: Any) {
        data.value.value = textField.text ?? ""
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? TextInputCellData {
            self.data = data
            label.text = data.labelText
            textField.placeholder = data.placeholder
        }
    }
}

public class TextInputCellData: MacaronInputCellData<TextInputCell, StringValue> {
    var placeholder: String

    public init(labelText: String, placeholder: String, value: StringValue) {
        self.placeholder = placeholder
        super.init(labelText: labelText, value: value)
    }
}
