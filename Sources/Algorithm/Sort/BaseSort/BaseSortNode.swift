//
//  BaseSortNode.swift
//  Algorithm
//
//  Created by feiyu on 2026/2/13.
//

struct SortInput: Codable, Hashable {
    var numbers: [Int]
}

class BaseSortNode: AlgorithmNode {
    
    var title: String = "base"
    
    var content: String = "base"
    
    var paramsExample: String = """
        {
            "numbers": [3,5,1,-7,4,9,-6,8,10,4]
        }
        """
    
    var references: [String] = [
        "https://blog.csdn.net/qq_51664685/article/details/124427443",
        "https://www.baidu.com"
    ]
    
    func filePath() -> String {
        fatalError("Not achieved")
    }
    
    func run(with param: SortInput) -> String {
        fatalError("Not achieved")
    }
    
}
