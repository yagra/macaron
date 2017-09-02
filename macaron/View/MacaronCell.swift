//
//  MacaronCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

open class MacaronCell: UITableViewCell {}

public protocol MacaronCellType {
    func getRowHeight() -> CGFloat
    func assign(data: inout MacaronCellDataType)
}
