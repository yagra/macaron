//
//  MacaronValue.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/27.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public protocol MacaronValueType {}

public class MacaronValue<T>: MacaronValueType {
    public var value: T

    init(_ value: T) {
        self.value = value
    }
}

public class StringValue: MacaronValue<String> {
    public override init(_ value: String="") {
        super.init(value)
    }
}

public class IntValue: MacaronValue<Int> {
    public override init(_ value: Int=0) {
        super.init(value)
    }
}

public class BoolValue: MacaronValue<Bool> {
    public override init(_ value: Bool=false) {
        super.init(value)
    }
}
