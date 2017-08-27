//
//  MacaronCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public class MacaronCell: UITableViewCell {}

public protocol MacaronCellType {
    func getRowHeight() -> CGFloat
    func assign(data: inout MacaronCellDataType)
}

public protocol MacaronInputCellType: MacaronCellType {}

public protocol MacaronActionCellType: MacaronCellType {}
