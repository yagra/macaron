//
//  ButtonActionCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class ButtonActionCell: MacaronCell, MacaronActionCellType {
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

            button.setTitle(data.text, for: .normal)
            button.setTitleColor(data.normalTextColor, for: .normal)
            button.setBackgroundImage(data.normalBackgroundColor.image, for: .normal)

            button.setTitleColor(data.disabledTextColor, for: .disabled)
            button.setBackgroundImage(data.disabledBackgroundColor.image, for: .disabled)

            if let font = data.font {
                button.titleLabel?.font = font
            }
            button.contentEdgeInsets = data.padding
            button.sizeToFit()
            height = button.frame.height
        }
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        action()
    }
    
}

public class ButtonActionCellData: MacaronActionCellData<ButtonActionCell> {
    public var text: String
    public var normalTextColor: UIColor
    public var disabledTextColor: UIColor
    public var font: UIFont?
    public var normalBackgroundColor: UIColor
    public var disabledBackgroundColor: UIColor
    public var padding: UIEdgeInsets
    public var enable: BoolValue

    public init(text: String, font: UIFont?=nil,
                normalTextColor: UIColor=UIColor.black, normalBackgroundColor: UIColor=UIColor.white,
                disabledTextColor: UIColor=UIColor.gray, disabledBackgroundColor: UIColor=UIColor.white,
                enable: BoolValue=BoolValue(true),
                padding: UIEdgeInsets=UIEdgeInsetsMake(9.0, 24.0, 9.0, 24.0),
                action: @escaping () -> Void) {
        self.text = text
        self.normalTextColor = normalTextColor
        self.disabledTextColor = disabledTextColor
        self.font = font
        self.normalBackgroundColor = normalBackgroundColor
        self.disabledBackgroundColor = disabledBackgroundColor
        self.padding = padding
        self.enable = enable
        super.init(action: action)
    }
}
