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

public extension MacaronCellDataType {
    public func $(_ handler: (Self) -> Void) -> Self {
        handler(self)
        return self
    }
}

open class MacaronCellData<Cell: MacaronCellType>: MacaronCellDataType {
    public var CellClassName: String {
        get {
            return String(describing: Cell.self)
        }
    }

    public init() {}
}
