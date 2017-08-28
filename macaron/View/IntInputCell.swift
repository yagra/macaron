//
//  IntInputCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/28.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class IntInputCell: MacaronCell, MacaronInputCellType {
    @IBOutlet weak public var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    private var data: IntInputCellData!

    public func getRowHeight() -> CGFloat {
        return 42
    }

    @IBAction func textFieldEditingChanged(_ sender: Any) {
        data.value.value = Int(textField.text ?? "") ?? 0
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? IntInputCellData {
            self.data = data
            label.text = data.labelText
            textField.placeholder = data.placeholder
        }
    }
}

public class IntInputCellData: MacaronInputCellData<IntInputCell, IntValue> {
    var placeholder: String

    public init(labelText: String, placeholder: String, value: IntValue) {
        self.placeholder = placeholder
        super.init(labelText: labelText, value: value)
    }
}
