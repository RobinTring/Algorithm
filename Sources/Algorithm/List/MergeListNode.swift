import Foundation

struct MergeListInput: Codable, Hashable {
    var arr1: [Int]
    var arr2: [Int]
    
    func list1() -> ListNode {
        ListNode(elements: arr1)
    }
    
    func list2() -> ListNode {
        ListNode(elements: arr2)
    }
}

class MergeListNode: AlgorithmNode {
    func filePath() -> String { #filePath }
    func references() -> [String] { [] }
    var paramsExample: String = """
        {
            "arr1": [1, 3, 5],
            "arr2": [2, 4, 6]
        }
        """
    
    func run(with param: MergeListInput) -> String {
        let list1 = param.list1()
        let list2 = param.list2()
        
        let dummy = ListNode.head
        var end = dummy
        
        var pos1: ListNode? = list1, pos2: ListNode? = list2
        
        while let p1 = pos1, let p2 = pos2 {
            if p1.val < p2.val {
                pos1 = p1.next
                end.next = p1
                end = p1
            } else {
                pos2 = p2.next
                end.next = p2
                end = p2
            }
        }
        
        end.next = pos1 ?? pos2
        
        return dummy.next!.description
    }
}
