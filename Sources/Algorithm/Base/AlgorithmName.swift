//
//  AlgorithmName.swift
//  Algorithm
//
//  Created by feiyu on 2026/2/14.
//

import Foundation

public enum AlgorithmName: String, CaseIterable, Hashable {
    case bubbleSort
    case selectionSort
    
    public func algorithmBody() -> any AlgorithmNode {
        switch self {
        case .bubbleSort: BubbleSortNode()
        case .selectionSort: SelectionSortNode()
        }
    }
    
    public var name: String {
        switch self {
        case .bubbleSort: "冒泡"
        case .selectionSort: "选择排序"
        }
    }
    
    public var content: String {
        switch self {
        case .bubbleSort:
            """
            冒泡排序（Bubble Sort）也是一种简单直观的排序算法。假设长度为n的数组arr，要按照从小到大排序。则冒泡排序的具体过程可以描述为：首先从数组的第一个元素开始到数组最后一个元素为止，对数组中相邻的两个元素进行比较，如果位于数组左端的元素大于数组右端的元素，则交换这两个元素在数组中的位置。这样操作后数组最右端的元素即为该数组中所有元素的最大值。接着对该数组除最右端的n-1个元素进行同样的操作，再接着对剩下的n-2个元素做同样的操作，直到整个数组有序排列。
            
            冒泡排序算法的原理如下：
            1. 比较相邻的元素。如果第一个比第二个大，就交换他们两个。
            2. 对每一对相邻元素做同样的工作，从开始第一对到结尾的最后一对。在这一点，最后的元素应该会是最大的数。
            3. 针对所有的元素重复以上的步骤，除了最后一个。
            4. 持续每次对越来越少的元素重复上面的步骤，直到没有任何一对数字需要比较。
            """
        case .selectionSort:
            """
             选择排序是一种简单直观的排序算法，无论什么数据进去都是 O(n²) 的时间复杂度。所以用到它的时候，数据规模越小越好。唯一的好处可能就是不占用额外的内存空间了吧。具体来说，假设长度为n的数组arr，要按照从小到大排序，那么先从n个数字中找到最小值min1，如果最小值min1的位置不在数组的最左端(也就是min1不等于arr[0])，则将最小值min1和arr[0]交换，接着在剩下的n-1个数字中找到最小值min2，如果最小值min2不等于arr[1]，则交换这两个数字，依次类推，直到数组arr有序排列。算法的时间复杂度为O(n^2)。

            选择排序算法的原理如下：
            ​ 1.首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置。
            ​ 2.再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
            ​ 3.重复第二步，直到所有元素均排序完毕。
            """
        }
    }
    
}
