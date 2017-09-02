//
//  Operators.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/09/02.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

infix operator ??=: AssignmentPrecedence
func ??= <T>(lhs: inout T, rhs: T?) {
    if let rhs = rhs {
        lhs = rhs
    }
}
