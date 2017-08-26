//
//  MacaronInputData.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronInputCellDataType: MacaronCellDataType {
    var labelText: String { get set }
}

public class MacaronInputCellData<C: MacaronInputCellType>: MacaronCellData<C>, MacaronInputCellDataType {
    public var labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }
}
