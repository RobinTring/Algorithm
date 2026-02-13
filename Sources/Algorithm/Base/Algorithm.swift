// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

enum Info {
    static let version = "0.1.0"
}

public struct AlgorithmError: Error {
    let message: String
}

public protocol AlgorithmNode {
    associatedtype T: Codable & Hashable
    /// 算法标题
    var title: String { get set }
    /// 算法描述
    var content: String { get set }
    
    /// 参数样例
    var paramsExample: String { get set }
    
    var references: [String] { get set }
    /// 代码文件路径，为定位源码文件
    func filePath() -> String
    /// 算法核心逻辑
    func run(with param: T) -> String
}

public extension AlgorithmNode {
    func codeUrl() -> URL? {
        let file = filePath()
        return URL(string: "https://github.com/RobinTring/Algorithm/blob/main/Sources/".appending(file))
    }
    
    func run(withJson json: String) throws(AlgorithmError) -> String {
        let params = try self.transform(from: json)
        return self.run(with: params)
    }
    
    func transform(from json: String) throws(AlgorithmError) -> T {
        guard let data = json.data(using: .utf8) else {
            throw AlgorithmError(message: "参数格式错误: \(json)")
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw AlgorithmError(message: "参数格式错误: \(error.localizedDescription)")
        }
    }
}

public enum AlgorithmName: String, CaseIterable, Hashable {
    case bubble
    
    public func algorithmBody() -> any AlgorithmNode {
        switch self {
        case .bubble:
            return BubbleSortNode()
        }
        fatalError("")
    }
}
