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
            button.setTitle(data.text, for: .normal)
            button.setTitleColor(data.textColor, for: .normal)
            if let font = data.font {
                button.titleLabel?.font = font
            }
            button.backgroundColor = data.backgroundColor
            button.contentEdgeInsets = data.padding
            height = button.frame.height + data.verticalMargin * 2
        }
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        action()
    }
    
}

public class ButtonActionCellData: MacaronActionCellData<ButtonActionCell> {
    public var text: String
    public var textColor: UIColor
    public var font: UIFont?
    public var backgroundColor: UIColor
    public var verticalMargin: CGFloat
    public var padding: UIEdgeInsets

    public init(text: String, textColor: UIColor=UIColor.black, font: UIFont?=nil,
         backgroundColor: UIColor=UIColor.white,
         verticalMargin: CGFloat=10.0, padding: UIEdgeInsets=UIEdgeInsetsMake(9.0, 24.0, 9.0, 24.0),
         action: @escaping () -> Void) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.verticalMargin = verticalMargin
        self.padding = padding
        super.init(action: action)
    }
}
