import Foundation

class HeapSortNode: BaseSortNode {
    override func filePath() -> String {
        #filePath
    }
    
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        
        heapSort(arr: &result)
        
        return result.map { String($0) }.joined(separator: " ")
    }
    
    func heapSort(arr: inout [Int]) -> Void {
        var idx = arr.count / 2 - 1
        while idx >= 0 {
            maxHeapify(arr: &arr, start: idx, end: arr.count - 1)
            idx -= 1
        }
        idx = arr.count - 1
        while idx > 0 {
            arr.swapAt(0, idx)
            maxHeapify(arr: &arr, start: 0, end: idx - 1)
            idx -= 1
        }
    }
    
    func maxHeapify(arr: inout [Int], start: Int, end: Int) -> Void {
        var dad = start
        var son = dad * 2 + 1
        while son <= end {
            if son + 1 <= end && arr[son] < arr[son + 1] {
                son += 1
            }
            if arr[dad] > arr[son] {
                return
            } else {
                arr.swapAt(dad, son)
                dad = son
                son = dad * 2 + 1
            }
        }
    }

}
