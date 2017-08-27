//
//  MacaronManageable.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/08/26.
//  Copyright © 2017年 yagra. All rights reserved.
//

import UIKit

public protocol MacaronManageable: UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView! { get }
    var cellData: [MacaronCellDataType] { get }
}

public extension MacaronManageable where Self: UIViewController {
    func initialize() {
        tableView.delegate = self
        tableView.dataSource = self
        for cell in Set(cellData.map{$0.CellClassName}) {
            tableView.register(UINib(nibName: cell, bundle: Config.MacaronBundle), forCellReuseIdentifier: cell)
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return cellData.count
    }

    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        var data = cellData[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: data.CellClassName,
                                                 for: indexPath) as! MacaronCellType
        cell.assign(data: &data)
        return cell as! UITableViewCell
    }
}
