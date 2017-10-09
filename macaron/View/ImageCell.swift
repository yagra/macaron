//
//  ImageCell.swift
//  macaron
//
//  Created by Ryosuke Hayashi on 2017/10/09.
//  Copyright © 2017年 yagra. All rights reserved.
//

import Foundation

public class ImageCell: MacaronCell, MacaronCellType {
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var topSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSpaceConstraint: NSLayoutConstraint!
    private var height: CGFloat = 0.0

    public func getRowHeight() -> CGFloat {
        return height
    }

    public func assign(data: inout MacaronCellDataType) {
        if let data = data as? ImageCellData {
            data.imageHandler(contentImageView)
            topSpaceConstraint.constant = data.topSpace
            bottomSpaceConstraint.constant = data.bottomSpace
            leftSpaceConstraint.constant = data.leftSpace
            rightSpaceConstraint.constant = data.rightSpace
            backgroundColor = data.backgroundColor
            height = data.imageHeight + data.bottomSpace + data.topSpace
        }
    }
}

public class ImageCellData: MacaronCellData<ImageCell> {
    public var imageHandler: (UIImageView) -> Void
    public var backgroundColor = UIColor.clear
    public var imageHeight: CGFloat
    public var topSpace: CGFloat = 0
    public var bottomSpace: CGFloat = 0
    public var leftSpace: CGFloat = 0
    public var rightSpace: CGFloat = 0

    public init(imageHeight: CGFloat, imageHandler: @escaping (UIImageView) -> Void) {
        self.imageHeight = imageHeight
        self.imageHandler = imageHandler
    }
}
