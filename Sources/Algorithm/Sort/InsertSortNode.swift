import Foundation

class InsertSortNode: BaseSortNode {
    override func filePath() -> String {
        #filePath
    }
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        
        for idx in 1..<result.count {
            let key = result[idx]
            var j = idx - 1
            while j >= 0 && result[j] >= key {
                result[j + 1] = result[j]
                j -= 1
            }
            result[j + 1] = key
        }
        return result.map { String($0) }.joined(separator: " ")
    }
}
