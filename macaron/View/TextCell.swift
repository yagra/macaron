//
//  TextCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class TextCell: MacaronCell, MacaronCellType {
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    private var height: CGFloat = 50.0
    @IBOutlet weak var label: UILabel!
    
    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? TextCellData {
            label.text = data.text
            label.textColor = data.textColor
            label.font ??= data.font
            label.sizeToFit()
            topSpaceConstraint.constant = data.topSpace
            bottomSpaceConstraint.constant = data.bottomSpace
            contentView.backgroundColor = data.backgroundColor
            height = label.frame.height + data.topSpace + data.bottomSpace
        }
    }
}

public class TextCellData: MacaronCellData<TextCell> {
    public var text: String
    public var textColor: UIColor = .black
    public var font: UIFont?
    public var backgroundColor: UIColor = .white
    public var topSpace: CGFloat = 0
    public var bottomSpace: CGFloat = 0

    public init(text: String) {
        self.text = text
    }
}
