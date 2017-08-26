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
    var cellElements: [MacaronDataType] { get }
}

public extension MacaronManageable where Self: UIViewController {
    func initialize() {
        tableView.delegate = self
        tableView.dataSource = self
        for cell in Set(cellElements.map{$0.cellClassName}) {
            tableView.register(UINib(nibName: cell, bundle: nil), forCellReuseIdentifier: cell)
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        return cellElements.count
    }

    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellElements[indexPath.row].cellClassName, for: indexPath)
        return cell
    }
}
