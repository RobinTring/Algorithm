import Foundation

struct MergeKListsInput: Codable, Hashable {
    var arrs: [[Int]]
    
    func lists() -> [ListNode] {
        arrs.map { ListNode(elements: $0) }
    }
}

class MergeKListsNode: AlgorithmNode {
    func filePath() -> String { #filePath }
    func references() -> [String] { [] }
    
    var paramsExample: String = """
        {
            "arrs" : [
                [1, 4, 7],
                [2, 5, 8],
                [3, 6, 9],
            ]
        }
        """
    
    func run(with param: MergeKListsInput) -> String {
        var listArr = param.lists()
        guard listArr.count > 1 else {
            return (listArr.first ?? ListNode.head).description
        }
        let dummy = ListNode.head
        var end = dummy
        while listArr.isEmpty == false {
            guard let (idx, minNode) = listArr.enumerated().min(by: { $0.element.val < $1.element.val }) else {
                break
            }
            end.next = minNode
            end = minNode
            if let next = minNode.next {
                listArr[idx] = next
            } else {
                listArr.remove(at: idx)
            }
        }
        return dummy.next!.description
    }
}
