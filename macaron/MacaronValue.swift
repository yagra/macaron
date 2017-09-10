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
    private var _value: T
    public var value: T {
        get {
            onGet?(_value)
            return _value
        } set {
            onSet?(newValue)
            _value = newValue
        }
    }
    public var onGet: ((_ v: T) -> Void)?
    public var onSet: ((_ v: T) -> Void)?

    init(_ value: T) {
        self._value = value
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
