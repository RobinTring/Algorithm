import Foundation

struct BinarySearchInput: Codable, Hashable {
    var numbers: [Int]
    var target: Int
}

class BinarySearchNode: AlgorithmNode {
    
    func references() -> [String] { [] }
    func filePath() -> String { #filePath }
    
    var paramsExample: String {
        """
        {
            "numbers" : [-1,0,3,4,6,10,13,14],
            "target" : 13
        }
        """
    }
    
    func run(with param: BinarySearchInput) -> String {
        return "位置: \(search(param.numbers, param.target))"
    }
    
    func search ( _ nums: [Int],  _ target: Int) -> Int {
        guard nums.count > 0  else { return -1 }
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = right - (right - left) / 2
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return -1
    }
}
