//
//  ButtonActionCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class ButtonActionCell: MacaronCell, MacaronCellType {
    private var height: CGFloat = 0.0
    private var action: (() -> Void)!
    @IBOutlet weak var button: UIButton!

    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? ButtonActionCellData {
            action = data.action
            button.isEnabled = data.enable.value
            data.enable.onSet = {
                self.button.isEnabled = $0
            }

            button.setTitle(data.text, for: .normal)
            button.setTitleColor(data.normalTextColor, for: .normal)
            button.setBackgroundImage(data.normalBackgroundColor.image, for: .normal)

            button.setTitleColor(data.disabledTextColor, for: .disabled)
            button.setBackgroundImage(data.disabledBackgroundColor.image, for: .disabled)

            button.titleLabel?.font ??= data.font
            button.contentEdgeInsets = data.padding
            button.sizeToFit()
            height = button.frame.height
        }
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        action()
    }
    
}

public class ButtonActionCellData: MacaronCellData<ButtonActionCell> {
    public var action: () -> ()
    public var text: String
    public var normalTextColor: UIColor = .black
    public var disabledTextColor: UIColor = .black
    public var font: UIFont?
    public var normalBackgroundColor: UIColor = .white
    public var disabledBackgroundColor: UIColor = .white
    public var padding = UIEdgeInsetsMake(9.0, 24.0, 9.0, 24.0)
    public var enable = BoolValue(true)

    public init(text: String, enable: BoolValue=BoolValue(true), _ action: @escaping () -> Void) {
        self.text = text
        self.enable = enable
        self.action = action
    }
}
