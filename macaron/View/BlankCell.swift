//
//  BlankCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/09/02.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class BlankCell: MacaronCell, MacaronCellType {
    private var height: CGFloat = 50.0

    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? BlankCellData {
            height = data.height
        }
    }
}

public class BlankCellData: MacaronCellData<BlankCell> {
    public var height: CGFloat

    public init(height: CGFloat) {
        self.height = height
        super.init()
    }
}
