import Foundation

class InOrderTreeNode: AlgorithmNode {
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
        var result = [Int]()
        inorder(param, result: &result)
        
        let rst2 = inorderTraversal(param)
        
        return """
            递归: \(result)
            "循环": \(rst2)
            """
    }
    
    func inorder(_ node: TreeNode?, result: inout [Int]) -> Void {
        guard let node = node else {
            return
        }
        inorder(node.left, result: &result)
        result.append(node.val)
        inorder(node.right, result: &result)
    }
    
    func inorderTraversal ( _ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var rst = [Int]()
        var stack = [TreeNode]()
        var pos: TreeNode? = root
        while stack.count > 0 || pos != nil {
            if let _pos = pos {
                stack.append(_pos)
                pos = _pos.left
            } else if let last = stack.popLast() {
                rst.append(last.val)
                pos = last.right
            }
        }
        return rst
    }
    
}
