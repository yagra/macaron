//
//  MacaronInputData.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronInputDataType: MacaronDataType {
    var labelText: String { get set }
}

public class MacaronInputData<C: MacaronInputCellType>: MacaronData<C>, MacaronInputDataType {
    public var labelText: String

    init(labelText: String) {
        self.labelText = labelText
    }
}
