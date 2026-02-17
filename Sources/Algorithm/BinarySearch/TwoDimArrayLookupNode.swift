import Foundation

struct TwoDimArrayLookupInput: Codable, Hashable {
    var twoDimArr: [[Int]]
    var target: Int
}

class TwoDimArrayLookupNode: AlgorithmNode {
    var paramsExample: String = """
        {
            "twoDimArr" :[
                [1,2,8,9],
                [2,4,9,12],
                [4,7,10,13],
                [6,8,11,15]
            ],
            "target" : 7
        }
        """
    
    func references() -> [String] { [] }
    
    func filePath() -> String { #filePath }
    
    func run(with param: TwoDimArrayLookupInput) -> String {
        return "\(Find(param.target, param.twoDimArr))"
    }
    
    func Find ( _ target: Int,  _ array: [[Int]]) -> Bool {
        let rowNum = array.count, colNum = array[0].count
        guard rowNum > 0 && colNum > 0
                && array[0][0] <= target
                && array[rowNum - 1][colNum - 1] >= target else {
            return false
        }
        var rowPos = 0, colPos = colNum - 1
        while rowPos < rowNum && colPos >= 0 {
            if target == array[rowPos][colPos] {
                return true
            } else if target > array[rowPos][colPos] {
                rowPos += 1
            } else if target < array[rowPos][colPos] {
                colPos -= 1
            }
        }
        return false
    }
}
