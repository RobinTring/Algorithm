
import Foundation

class SelectionSortNode : BaseSortNode {
    
    override func filePath() -> String { #filePath }
    
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        
        for idx in 0..<(result.count - 1) {
            var min = idx
            for jdx in (idx + 1)..<result.count {
                if result[min] > result[jdx] {
                    min = jdx
                }
            }
            result.swapAt(min, idx)
        }
        
        return result.map { String($0) }.joined(separator: " ")
    }
}
