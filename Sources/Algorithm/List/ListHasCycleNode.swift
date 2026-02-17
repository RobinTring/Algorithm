import Foundation

struct ListHasCycleInput: Codable, Hashable {
    var arr: [Int]
    var enterIndex: Int
    
    func createCycleList() -> ListNode {
        let list = ListNode(elements: arr)
        if enterIndex < arr.count && enterIndex >= 0 {
            var idx = enterIndex
            var pos = list
            var enterNode = list
            while let next = pos.next {
                if idx == 0 {
                    enterNode = pos
                }
                pos = next
                idx -= 1
            }
            pos.next = enterNode
        }
        return list
    }
}

class ListHasCycleNode: AlgorithmNode {
    func filePath() -> String {
        #filePath
    }
    func references() -> [String] {
        []
    }
    var paramsExample: String = """
        {
            "arr" : [1, 2, 3, 4, 5],
            "enterIndex" : 2
        }
        """
    
    func run(with param: ListHasCycleInput) -> String {
        let list = param.createCycleList()
        var slow = list, fast = list
        while let next = fast.next, let pnext = next.next {
            slow = slow.next!
            fast = pnext
            if slow === fast {
                return "true: \(list)"
            }
        }
        return "false: \(list)"
    }
}
