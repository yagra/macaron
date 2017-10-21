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
    @IBOutlet weak var leftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSpaceConstraint: NSLayoutConstraint!
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
            label.numberOfLines = data.numberOfLines
            label.sizeToFit()
            label.textAlignment = data.labelTextAlignment
            topSpaceConstraint.constant = data.topSpace
            bottomSpaceConstraint.constant = data.bottomSpace
            leftSpaceConstraint.constant = data.leftSpace
            rightSpaceConstraint.constant = data.rightSpace
            backgroundColor = data.backgroundColor
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
    public var leftSpace: CGFloat = 12
    public var rightSpace: CGFloat = 12
    public var numberOfLines: Int
    public var labelTextAlignment: NSTextAlignment = .left

    public init(text: String, numberOfLines: Int=1) {
        self.text = text
        self.numberOfLines = numberOfLines
    }
}
