import Foundation

class MergeSortNode: BaseSortNode {
    override func filePath() -> String {
        #filePath
    }
    
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        
        process(arr: &result, left: 0, right: result.count - 1)
        
        return result.map { String($0) }.joined(separator: " ")
    }
    
    func process(arr: inout [Int], left: Int, right: Int) -> Void {
        guard left < right else { return }
        let mid = left + (right - left) / 2
        process(arr: &arr, left: left, right: mid)
        process(arr: &arr, left: mid + 1, right: right)
        
        mergeSort(arr: &arr, left: left, mid: mid, right: right)
    }
    
    func mergeSort(arr: inout [Int], left: Int, mid: Int, right: Int) -> Void {
        var helper = [Int]()
        
        var i = left, j = mid + 1
        
        while i <= mid && j <= right {
            if arr[i] < arr[j] {
                helper.append(arr[i])
                i += 1
            } else {
                helper.append(arr[j])
                j += 1
            }
        }
        
        while i <= mid {
            helper.append(arr[i])
            i += 1
        }
        
        while j <= right {
            helper.append(arr[j])
            j += 1
        }
        
        for idx in left...right {
            arr[idx] = helper[idx - left]
        }
    }

}
