import Foundation

struct ReverseListBetweenInput: Codable, Hashable {
    var arr: [Int]
    var start: Int
    var end: Int
    
    func list() -> ListNode {
        ListNode(elements: arr)
    }
}

class ReverseListBetweenNode: AlgorithmNode {
    func filePath() -> String { #filePath }
    func references() -> [String] { [] }
    
    var paramsExample: String = """
        {
            "arr" : [1, 2, 3, 4, 5, 6],
            "start" : 2,
            "end" : 5
        }
        """
    
    func run(with param: ReverseListBetweenInput) -> String {
        let n = param.start
        let m = param.end
        guard n > 0 , m > n else {
            return param.arr.map { String($0) }.joined(separator: " ")
        }
        let dummy = ListNode(0, next: param.list())
        var pNode = dummy, pos = dummy.next!
        var idx = 1
        while idx < n, let next = pos.next {
            idx += 1
            pNode = pos
            pos = next
        }
        
        while idx < m, let next = pos.next {
            idx += 1
            pos.next = next.next
            next.next = pNode.next
            pNode.next = next
        }
        
        return dummy.next?.description ?? ""
    }
}
