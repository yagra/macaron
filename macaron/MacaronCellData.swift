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


precedencegroup HandlingCondition {
    associativity: left
    higherThan: AssignmentPrecedence
    lowerThan: TernaryPrecedence
}

infix operator <!: HandlingCondition
public func <! <D>(d: D, handler: (D) -> Void) -> D where D: MacaronCellDataType {
    handler(d)
    return d
}

open class MacaronCellData<Cell: MacaronCellType>: MacaronCellDataType {
    public var CellClassName: String {
        get {
            return String(describing: Cell.self)
        }
    }

    public init() {}
}
