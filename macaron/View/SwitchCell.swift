//
//  SwitchCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/09/02.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class SwitchCell: MacaronCell, MacaronInputCellType {
    private var data: SwitchCellData!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var toggle: UISwitch!

    public func getRowHeight() -> CGFloat {
        return 34
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? SwitchCellData {
            self.data = data
            label.text = data.labelText
            label.textAlignment = data.labelTextAlignment
            toggle.isOn = data.value.value
        }
    }

    @IBAction func switchValueChanged(_ sender: Any) {
        self.data.value.value = toggle.isOn
    }
}

public class SwitchCellData: MacaronInputCellData<SwitchCell, BoolValue> {
    public var labelTextAlignment: NSTextAlignment

    public init(labelText: String, value: InputType, labelTextAlignment: NSTextAlignment=NSTextAlignment.center) {
        self.labelTextAlignment = labelTextAlignment
        super.init(labelText: labelText, value: value)
    }
}
