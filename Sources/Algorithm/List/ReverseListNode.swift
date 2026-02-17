import Foundation

struct ReverseListInput: Codable, Hashable {
    var arr: [Int]
    
    func list() -> ListNode {
        ListNode(elements: arr)
    }
}

class ReverseListNode: AlgorithmNode {
    var paramsExample: String = """
        {
            "arr": [1, 2, 3, 4, 5]
        }
        """
    
    func filePath() -> String { #filePath }
    func references() -> [String] { [] }
    
    func run(with param: ReverseListInput) -> String {
        let recursion = ReverseList_recursion(param.list())
        let loop = ReverseList(param.list())
        return """
            递归: \(recursion)
            循环: \(loop)
            """
    }
    
    func ReverseList_recursion( _ head: ListNode) -> ListNode {
        if let next = head.next {
            let newHead = ReverseList_recursion(next)
            next.next = head
            head.next = nil
            return newHead
        } else {
            return head
        }
    }
    
    func ReverseList( _ head: ListNode) -> ListNode {
        let dummy = ListNode.head
        var pos:ListNode? = head
        while let cur = pos {
            pos = cur.next
            cur.next = dummy.next
            dummy.next = cur
        }
        return dummy.next!
    }
}
