import Foundation

struct RemoveNthFromEndInput: Codable, Hashable {
    var arr: [Int]
    var n: Int
    func createList() -> ListNode { ListNode(elements: arr) }
}

class RemoveNthFromEndNode: AlgorithmNode {
    func filePath() -> String {
        #filePath
    }
    func references() -> [String] {
        []
    }
    var paramsExample: String = """
        {
            "arr" : [1, 2, 3, 4, 5, 6],
            "n" : 3
        }
        """
    
    func run(with param: RemoveNthFromEndInput) -> String {
        guard param.n > 0 else { return param.createList().description }
        
        let list = param.createList()
        
        let dummy = ListNode(0, next: list)
        var detector = dummy, prePos = dummy
        var n = param.n
        
        while n > 0, let next = detector.next {
            n -= 1
            detector = next
        }
        
        guard n == 0 else { return (dummy.next ?? .head).description }
        
        while let next = detector.next, let nextPre = prePos.next {
            detector = next
            prePos = nextPre
        }
        prePos.next = prePos.next?.next
        return dummy.next!.description
    }
}
