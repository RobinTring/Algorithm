//
//   BubbleSortNode.swift
//  Algorithm
//
//  Created by feiyu on 2026/2/13.
//

class BubbleSortNode: BaseSortNode {
    
    override init() {
        super.init()
        title = "冒泡"
        content = """
            冒泡排序（Bubble Sort）也是一种简单直观的排序算法。假设长度为n的数组arr，要按照从小到大排序。则冒泡排序的具体过程可以描述为：首先从数组的第一个元素开始到数组最后一个元素为止，对数组中相邻的两个元素进行比较，如果位于数组左端的元素大于数组右端的元素，则交换这两个元素在数组中的位置。这样操作后数组最右端的元素即为该数组中所有元素的最大值。接着对该数组除最右端的n-1个元素进行同样的操作，再接着对剩下的n-2个元素做同样的操作，直到整个数组有序排列。
            """
    }
    
    override func filePath() -> String {
        #filePath
    }
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        for idx in 0..<result.count {
            for jdx in 0..<result.count - idx - 1 {
                if result[jdx] > result[jdx + 1] {
                    result.swapAt(jdx, jdx + 1)
                }
            }
        }
        return result.map { String($0) }.joined(separator: " ")
    }
}
