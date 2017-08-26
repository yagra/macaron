//
//  MacaronData.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronCellDataType {
    var cellClassName: String { get }
}

public class MacaronCellData<C: MacaronCellType>: MacaronCellDataType {
    public var cellClassName: String {
        get {
            return String(describing: C.self)
        }
    }

}
