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
    public func getRowHeight() -> CGFloat {
        return lineHeight
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? LineCellData {
            lineHeight = data.height
            contentView.backgroundColor = data.color
        }
    }
}

public class LineCellData: MacaronCellData<LineCell> {
    var height: CGFloat
    var color: UIColor

    public init(height: CGFloat, color: UIColor) {
        self.height = height
        self.color = color
        super.init()
    }
}
