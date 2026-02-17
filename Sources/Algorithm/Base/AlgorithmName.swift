//
//  AlgorithmName.swift
//  Algorithm
//
//  Created by feiyu on 2026/2/14.
//

import Foundation

public enum AlgorithmName: String, CaseIterable, Hashable {
    case bubbleSort = "冒泡排序"
    case selectionSort = "选择排序"
    case insertSort = "插入排序"
    case shellSort = "希尔排序"
    case mergeSort = "归并排序"
    case quickSort = "快速排序"
    case heapSort = "堆排序"
    
    case binarySearch = "二分查找"
    case twoDimArrayLookup = "二维二分查找"
    
    case reverseList = "翻转链表"
    case reverseListBetween = "链表区间翻转"
    case reverseKGroupList = "链表分段翻转"
    case mergeList = "合并链表"
    case mergeKLists = "多链表合并"
    case listHasCycle = "链表是否有环"
    case findKthToTail = "链表最后n个数"
    case removeNthFromEnd = "删除倒数第n个数"
    
    case preOrderTree = "树前序遍历"
    case inOrderTree = "中序遍历"
    case postOrderTree = "后续遍历"
    
    public func algorithmBody() -> any AlgorithmNode {
        switch self {
        case .bubbleSort: BubbleSortNode()
        case .selectionSort: SelectionSortNode()
        case .insertSort: InsertSortNode()
        case .shellSort: ShellSortNode()
        case .mergeSort: MergeSortNode()
        case .quickSort: QuickSortNode()
        case .heapSort: HeapSortNode()
        case .binarySearch: BinarySearchNode()
        case .twoDimArrayLookup: TwoDimArrayLookupNode()
        case .reverseList: ReverseListNode()
        case .reverseListBetween: ReverseListBetweenNode()
        case .reverseKGroupList: ReverseKGroupNode()
        case .mergeList: MergeListNode()
        case .mergeKLists: MergeKListsNode()
        case .listHasCycle: ListHasCycleNode()
        case .findKthToTail: FindKthToTailNode()
        case .removeNthFromEnd: RemoveNthFromEndNode()
        case .preOrderTree: PreOrderTreeNode()
        case .inOrderTree: InOrderTreeNode()
        case .postOrderTree: PostOrderTreeNode()
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
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .selectionSort:
            """
             选择排序是一种简单直观的排序算法，无论什么数据进去都是 O(n²) 的时间复杂度。所以用到它的时候，数据规模越小越好。唯一的好处可能就是不占用额外的内存空间了吧。具体来说，假设长度为n的数组arr，要按照从小到大排序，那么先从n个数字中找到最小值min1，如果最小值min1的位置不在数组的最左端(也就是min1不等于arr[0])，则将最小值min1和arr[0]交换，接着在剩下的n-1个数字中找到最小值min2，如果最小值min2不等于arr[1]，则交换这两个数字，依次类推，直到数组arr有序排列。算法的时间复杂度为O(n^2)。

            选择排序算法的原理如下：
            ​ 1.首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置。
            ​ 2.再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
            ​ 3.重复第二步，直到所有元素均排序完毕。
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .insertSort:
            """
            插入排序（Insertion-Sort）的算法描述是一种简单直观的排序算法。它的工作原理是通过构建有序序列，对于未排序数据，在已排序序列中从后向前扫描，找到相应位置并插入。例如要将数组arr=[4,2,8,0,5,1]排序，可以将4看做是一个有序序列，将[2,8,0,5,1]看做一个无序序列。无序序列中2比4小，于是将2插入到4的左边，此时有序序列变成了[2,4]，无序序列变成了[8,0,5,1]。无序序列中8比4大，于是将8插入到4的右边，有序序列变成了[2,4,8],无序序列变成了[0,5,1]。以此类推，最终数组按照从小到大排序。该算法的时间复杂度为O(n^2)。

            插入排序算法的原理如下：

            ​ 1.从第一个元素开始，该元素可以认为已经被排序；
            ​ 2.取出下一个元素，在已经排序的元素序列中从后向前扫描；
            ​ 3.如果该元素（已排序）大于新元素，将该元素移到下一位置；
            ​ 4.重复步骤3，直到找到已排序的元素小于或者等于新元素的位置；
            ​ 5.将新元素插入到该位置后；
            ​ 6.重复步骤2~5。
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .shellSort:
            """
            希尔排序(Shell’s Sort)在插入排序算法的基础上进行了改进，算法的时间复杂度与前面几种算法相比有较大的改进，但希尔排序是非稳定排序算法。其算法的基本思想是：先将待排记录序列分割成为若干子序列分别进行插入排序，待整个序列中的记录"基本有序"时，再对全体记录进行一次直接插入排序。该算法时间复杂度为O(n log n)。

            希尔排序算法的原理如下：

            ​ 1.选择一个增量序列 t1，t2，……，tk，其中 ti > tj, tk = 1；
            ​ 2.按增量序列个数 k，对序列进行 k 趟排序；
            ​ 3.每趟排序，根据对应的增量 ti，将待排序列分割成若干长度为 m 的子序列，分别对各子表进行直接插入排序。仅增量因子为 1 时，整个序列作为一个表来处理，表长度即为整个序列的长度。
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .mergeSort:
            """
            归并排序是建立在归并操作上的一种有效的排序算法。该算法是采用分治法（Divide and Conquer）的一个非常典型的应用。将已有序的子序列合并，得到完全有序的序列；即先使每个子序列有序，再使子序列段间有序。代价是需要额外的内存空间。若将两个有序表合并成一个有序表，称为2-路归并。 该算法时间复杂度为O(n log n)。

            希尔排序算法的原理如下：

            ​ 1.把长度为n的输入序列分成两个长度为n/2的子序列；
            ​ 2.对这两个子序列分别采用归并排序；
            ​ 3.将两个排序好的子序列合并成一个最终的排序序列。
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .quickSort:
            """
            快速排序通常明显比其他 Ο(nlogn) 算法更快，因为它的内部循环（inner loop）可以在大部分的架构上很有效率地被实现出来。快速排序的基本思想是：通过一趟排序将待排记录分割成独立的两部分，其中一部分记录的关键字均比另一部分记录的关键字小，则可分别对这两部分记录继续进行排序，已达到整个序列有序。一趟快速排序的具体过程可描述为：从待排序列中任意选取一个记录(通常选取第一个记录)作为基准值，然后将记录中关键字比它小的记录都安置在它的位置之前，将记录中关键字比它大的记录都安置在它的位置之后。这样，以该基准值为分界线，将待排序列分成的两个子序列。它是处理大数据最快的排序算法之一了。该算法时间复杂度为O(n log n)。

            快速排序算法的原理如下：

            ​ 1. 从数列中挑出一个元素，称为 “基准”（pivot）;
             2. 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作；
            ​ 3. 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
        case .heapSort:
            """
            堆排序（Heapsort）是指利用堆这种数据结构所设计的一种排序算法。堆积是一个近似完全二叉树的结构，并同时满足堆积的性质：即子结点的键值或索引总是小于（或者大于）它的父节点。堆排序可以说是一种利用堆的概念来排序的选择排序。分为两种方法：每个结点的值都大于等于其左右孩子结点的值，称为大顶堆；或者每个结点的值都小于等于其左右孩子结点的值，称为小顶堆。该算法时间复杂度为O(n log n)。

            堆排序算法的原理如下：

            ​ 1.将初始待排序关键字序列(R1,R2….Rn)构建成大顶堆，此堆为初始的无序区；
            ​ 2.将堆顶元素R[1]与最后一个元素R[n]交换，此时得到新的无序区(R1,R2,……Rn-1)和新的有序区(Rn),且满足R[1,2…n-1]<=R[n]；
             3.由于交换后新的堆顶R[1]可能违反堆的性质，因此需要对当前无序区(R1,R2,……Rn-1)调整为新堆，然后再次将R[1]与无序区最后一个元素交换，得到新的无序区(R1,R2….Rn-2)和新的有序区(Rn-1,Rn)。不断重复此过程直到有序区的元素个数为n-1，则整个排序过程完成。
            
            ————————————————
            版权声明：本文为CSDN博主「calm_JayBo」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
            原文链接：https://blog.csdn.net/qq_51664685/article/details/124427443
            """
            
        case .binarySearch:
            """
            ‌二分查找（Binary Search），又称折半查找，是一种在有序数组或有序序列中查找特定元素的高效搜索算法，其核心思想是通过不断将搜索区间减半来快速定位目标值‌。‌
            
            算法原理与步骤
            
            二分查找基于分治策略，要求数据必须按关键字有序（升序或降序）。其基本步骤如下：‌
            1 初始化搜索区间‌：
                设左边界 left 为 0，右边界 right 为数组长度减 1（对应闭区间 [left, right]）。
            ‌‌2 计算中间位置‌：
                取中间索引 mid = left + (right - left) / 2（防止整数溢出）。‌‌
            3 比较与调整‌： 
                若中间元素等于目标值，则查找成功，返回 mid。‌
                若中间元素大于目标值，说明目标值在左半部分，将 right 更新为 mid - 1。‌‌
                若中间元素小于目标值，说明目标值在右半部分，将 left 更新为 mid + 1。‌‌
            4 重复迭代‌：重复步骤 2-3，直到找到目标值或区间为空（即 left > right），此时查找失败。‌
            """
        default:
            """
            未补充
            """
        }
    }
    
}
