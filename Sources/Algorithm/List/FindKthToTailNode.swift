import Foundation

struct FindKthToTailInput: Codable, Hashable {
    var arr: [Int]
    var k: Int
    func createList() -> ListNode {
        ListNode(elements: arr)
    }
}

class FindKthToTailNode: AlgorithmNode {
    func filePath() -> String {
        #filePath
    }
    func references() -> [String] {
        []
    }
    var paramsExample: String = """
        {
            "arr" : [1, 2, 3, 4, 5, 6],
            "k" : 2
        }
        """
    func run(with param: FindKthToTailInput) -> String {
        guard param.k > 0 else {
            return param.createList().description
        }
        let list = param.createList()
        var k = param.k
        var pos = list
        var detector = pos
        while let next = detector.next, k > 1 {
            detector = next
            k -= 1
        }
        while let next = detector.next {
            detector = next
            pos = pos.next!
        }
        return pos.description
    }
}
