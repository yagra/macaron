//
//  MacaronCellData.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronCellDataType {
    var CellClassName: String { get }
}

public class MacaronCellData<Cell: MacaronCellType>: MacaronCellDataType {
    public var CellClassName: String {
        get {
            return String(describing: Cell.self)
        }
    }
}

public protocol MacaronInputCellDataType: MacaronCellDataType {
    associatedtype InputType

    var labelText: String { get set }
    var value: InputType { get set }
}

public class MacaronInputCellData<Cell: MacaronInputCellType, T>: MacaronCellData<Cell>, MacaronInputCellDataType {
    public typealias InputType = T

    public var labelText: String
    public var value: InputType

    init(labelText: String, value: InputType) {
        self.labelText = labelText
        self.value = value
    }
}
