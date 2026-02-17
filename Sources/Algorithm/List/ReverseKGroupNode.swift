import Foundation

struct ReverseKGroupInput: Codable, Hashable {
    var arr: [Int]
    var k: Int
    
    func list() -> ListNode {
        ListNode(elements: arr)
    }
}

class ReverseKGroupNode: AlgorithmNode {
    func filePath() -> String { #filePath }
    func references() -> [String] { [] }
    
    var paramsExample: String = """
        {
            "arr" : [1, 2, 3, 4, 5, 6, 7, 8],
            "k" : 3
        }
        """
    
    func run(with param: ReverseKGroupInput) -> String {
        let k = param.k
        guard k > 1 else {
            return param.arr.map { String($0) }.joined(separator: " ")
        }
        let dummy = ListNode(0, next: param.list())
        
        var pPos = dummy, pos = dummy
        var count = 0
        
        while let next = pos.next {
            pos = next
            count += 1
            if count >= k, let newEnd = pPos.next {
                while pPos.next != pos, let pNext = pPos.next {
                    pPos.next = pNext.next
                    pNext.next = pos.next
                    pos.next = pNext
                }
                pPos = newEnd
                pos = newEnd
                count = 0
            }
        }
        
        return dummy.next!.description
    }
}
