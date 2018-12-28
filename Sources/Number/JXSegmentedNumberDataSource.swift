//
//  JXSegmentedNumberDataSource.swift
//  JXSegmentedView
//
//  Created by jiaxin on 2018/12/28.
//  Copyright © 2018 jiaxin. All rights reserved.
//

import Foundation
import UIKit

open class JXSegmentedNumberDataSource: JXSegmentedTitleDataSource {
    /// 需要和titles数组数量一致，没有数字的item填0！！！
    open var numbers = [Int]()
    /// numberLabel的宽度补偿，label真实的宽度是文字内容的宽度加上补偿的宽度
    open var numberWidthIncrement: CGFloat = 10
    open var numberBackgroundColor: UIColor = .red
    open var numberTextColor: UIColor = .white
    open var numberFont: UIFont = UIFont.systemFont(ofSize: 11)

    open override func preferredItemModelInstance() -> JXSegmentedBaseItemModel {
        return JXSegmentedNumberItemModel()
    }

    open override func reloadData(selectedIndex: Int) {
        super.reloadData(selectedIndex: selectedIndex)

        for (index, itemModel) in (dataSource as! [JXSegmentedNumberItemModel]).enumerated() {
            itemModel.number = numbers[index]
            itemModel.numberTextColor = numberTextColor
            itemModel.numberBackgroundColor = numberBackgroundColor
        }
    }

    //MARK: - JXSegmentedViewDataSource
    open override func registerCellClass(in segmentedView: JXSegmentedView) {
        segmentedView.register(JXSegmentedNumberCell.self, forCellWithReuseIdentifier: "cell")
    }

    open override func segmentedView(_ segmentedView: JXSegmentedView, cellForItemAt index: Int) -> JXSegmentedBaseCell {
        let cell = segmentedView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        return cell
    }

    open override func dataSource(in segmentedView: JXSegmentedView) -> [JXSegmentedBaseItemModel] {
        reloadData(selectedIndex: segmentedView.selectedIndex)
        return dataSource
    }
}
