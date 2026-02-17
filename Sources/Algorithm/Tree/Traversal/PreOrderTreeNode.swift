import Foundation

class PreOrderTreeNode: AlgorithmNode {
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
        // 方法一：递归
        var result = [Int]()
        preorder(param, result: &result)
        
        let rst2 = preorderTraversal(param)
        return """
            递归: \(result)
            循环: \(rst2)
            """
    }
    
    func preorder(_ node: TreeNode?, result: inout [Int]) -> Void {
        guard let node = node else {
            return
        }
        result.append(node.val)
        preorder(node.left, result: &result)
        preorder(node.right, result: &result)
    }
    
    func preorderTraversal( _ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var rst = [Int]()
        var stack = [TreeNode]()
        var pos: TreeNode? = root
        while stack.count > 0 || pos != nil {
            if let _pos = pos {
                rst.append(_pos.val)
                stack.append(_pos)
                pos = _pos.left
            } else if let last = stack.popLast() {
                pos = last.right
            }
        }
        return rst
    }
}
