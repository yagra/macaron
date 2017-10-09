//
//  LineCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class LineCell: MacaronCell, MacaronCellType {
    var lineHeight: CGFloat = 1.0
    @IBOutlet weak var leftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var bodyView: UIView!
    
    public func getRowHeight() -> CGFloat {
        return lineHeight
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? LineCellData {
            lineHeight = data.height
            leftSpaceConstraint.constant = data.leftSpace
            rightSpaceConstraint.constant = data.rightSpace
            bodyView.backgroundColor = data.color
        }
    }
}

public class LineCellData: MacaronCellData<LineCell> {
    public var height: CGFloat
    public var color: UIColor
    public var leftSpace: CGFloat = 0.0
    public var rightSpace: CGFloat = 0.0

    public init(height: CGFloat, color: UIColor) {
        self.height = height
        self.color = color
        super.init()
    }
}
