import Foundation

public class ListNode: Codable, ExpressibleByArrayLiteral {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int = 0, next: ListNode? = nil) {
        self.val = val
        self.next = next
    }
    
    public typealias ArrayLiteralElement = Int
    public required init(arrayLiteral elements: Int...) {
        guard let first = elements.first else {
            (val, next) = (0, nil)
            return
        }
        val = first
        next = elements[1...].reversed().reduce(nil, { partialResult, item in
            ListNode(item, next: partialResult)
        })
    }
    
    required init(elements: [Int]) {
        guard let first = elements.first else {
            (val, next) = (0, nil)
            return
        }
        val = first
        next = elements[1...].reversed().reduce(nil, { partialResult, item in
            ListNode(item, next: partialResult)
        })
    }
}

extension ListNode {
    class var head: ListNode { ListNode(0) }
    func append(_ val: Int) -> ListNode {
        let node = ListNode(val)
        var pos = self
        while let next = pos.next {
            pos = next
        }
        pos.next = node
        return node
    }
    func next(val: Int) -> ListNode {
        let node = ListNode(val)
        self.next = node
        return node
    }
}

extension ListNode: CustomStringConvertible, Hashable {
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        lhs === rhs
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
    }
    
    public var description: String {
        var list = [val]
        var pos: ListNode? = next
        var set = Set<ListNode>()
        var come: ListNode?
        while let item = pos {
            if set.contains(item) {
                come = item
                break
            }
            list.append(item.val)
            pos = item.next
            set.insert(item)
        }
        if let come {
            return "\(list) come: \(come.val)"
        }
        return "\(list)"
    }
}
