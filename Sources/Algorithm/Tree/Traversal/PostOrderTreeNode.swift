import Foundation

class PostOrderTreeNode: AlgorithmNode {
    func filePath() -> String {
        #filePath
    }
    func references() -> [String] {
        []
    }
    var paramsExample: String = """
        {
            "val" : 1,
            "left" : {
                "val" : 2,
                "left" : {
                    "val" : 4
                },
                "right" : {
                    "val" : 5
                }
            },
            "right" : {
                "val" : 3,
                "left" : {
                    "val" : 6
                },
                "right" : {
                    "val" : 7
                }
            }
        }
        """
    
    func run(with param: TreeNode) -> String {
        var rst = [Int]()
        postorder(param, result: &rst)
        
        let rst2 = postorderTraversal(param)
        
        return """
            递归: \(rst)
            循环: \(rst2)
            """
    }
    
    func postorder(_ node: TreeNode?, result: inout [Int]) -> Void {
        guard let node = node else {
            return
        }
        postorder(node.left, result: &result)
        postorder(node.right, result: &result)
        result.append(node.val)
    }
    
    func postorderTraversal ( _ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var rst = [Int]()
        var stack = [TreeNode]()
        var pos: TreeNode? = root
        var pre: TreeNode? = nil
        while stack.count > 0 || pos != nil {
            if let _pos = pos {
                stack.append(_pos)
                pos = _pos.left
            } else if let last = stack.last {
                if let right = last.right, right !== pre {
                    pos = last.right
                } else {
                    rst.append(last.val)
                    pre = last
                    stack.removeLast()
                }
            }
        }
        return rst
    }
}
