//
//  MacaronValue.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronValue {}

public class StringValue: MacaronValue {
    public var value: String

    public convenience init() {
        self.init("")
    }

    public init(_ value: String) {
        self.value = value
    }
}
