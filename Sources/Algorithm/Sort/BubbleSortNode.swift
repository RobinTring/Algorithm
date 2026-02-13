//
//   BubbleSortNode.swift
//  Algorithm
//
//  Created by feiyu on 2026/2/13.
//

class BubbleSortNode: BaseSortNode {
    
    override func filePath() -> String {
        #filePath
    }
    
    override func run(with param: SortInput) -> String {
        var result = param.numbers
        for idx in 0..<result.count {
            for jdx in 0..<result.count - idx - 1 {
                if result[jdx] > result[jdx + 1] {
                    result.swapAt(jdx, jdx + 1)
                }
            }
        }
        return result.map { String($0) }.joined(separator: " ")
    }
}
