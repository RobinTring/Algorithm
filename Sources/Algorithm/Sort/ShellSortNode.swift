import Foundation

class ShellSortNode: BaseSortNode {
    override func filePath() -> String {
        #filePath
    }
    
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        var gap = result.count / 2
        
        while gap > 0 {
            for idx in gap..<result.count {
                let val = result[idx]
                var pos = idx
                while pos - gap >= 0 && result[pos - gap] > val {
                    result[pos] = result[pos - gap]
                    pos = pos - gap
                }
                result[pos] = val
            }
            gap /= 2
        }
        
        return result.map { String($0) }.joined(separator: " ")
    }
}
