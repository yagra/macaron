//
//  TextCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class TextCell: MacaronCell, MacaronCellType {
    private var height: CGFloat = 50.0
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelTopMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var labelBottomMarginConstraint: NSLayoutConstraint!
    
    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? TextCellData {
            label.text = data.text
            label.textColor = data.textColor
            if let font = data.font {
                label.font = font
            }
            label.sizeToFit()
            contentView.backgroundColor = data.backgroundColor
            if let margin = data.topMargin {
                labelTopMarginConstraint.constant = margin
            }
            if let margin = data.bottomMargin {
                labelBottomMarginConstraint.constant = margin
            }
            height = label.frame.height + labelTopMarginConstraint.constant + labelBottomMarginConstraint.constant
        }
    }
}

public class TextCellData: MacaronCellData<TextCell> {
    var text: String
    var textColor: UIColor
    var font: UIFont?
    var backgroundColor: UIColor
    var topMargin: CGFloat?
    var bottomMargin: CGFloat?

    public init(text: String, textColor: UIColor=UIColor.black, font: UIFont?=nil,
                backgroundColor: UIColor=UIColor.white,
                topMargin: CGFloat?=nil, bottomMargin: CGFloat?=nil) {
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = backgroundColor
        self.topMargin = topMargin
        self.bottomMargin = bottomMargin
        super.init()
    }
}
