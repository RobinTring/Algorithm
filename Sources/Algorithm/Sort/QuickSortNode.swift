import Foundation

class QuickSortNode: BaseSortNode {
    override func filePath() -> String {
        #filePath
    }
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        quickSort(arr: &result, start: 0, end: result.count - 1)
        return result.map { String($0) }.joined(separator: " ")
    }
    
    func quickSort(arr: inout [Int], start: Int, end: Int) -> Void {
        guard start < end else {
            return
        }
        var left = start, right = end
        
        let key = arr[start]
        
        while left < right {
            while left < right && arr[right] >= key {
                right -= 1
            }
            if left < right {
                arr[left] = arr[right]
                left += 1
            }
            while left < right && arr[left] < key {
                left += 1
            }
            if left < right {
                arr[right] = arr[left]
                right -= 1
            }
        }
        arr[left] = key
        
        quickSort(arr: &arr, start: start, end: left - 1)
        quickSort(arr: &arr, start: left + 1, end: end)
    }
}
