//
//  MacaronInputCellType.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public protocol MacaronInputCellType: MacaronCellType {
    associatedtype T
    var label: UILabel! { get }
    var value: T { get set }
    var valuePointer: UnsafeMutablePointer<T>! { get set }
}

public extension MacaronInputCellType where Self: MacaronCell {
    func point() {
        valuePointer.pointee = value
    }
}
