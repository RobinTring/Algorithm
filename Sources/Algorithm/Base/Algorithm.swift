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
    
    /// 参数样例
    var paramsExample: String { get }
    
    var references: [String] { get }
    /// 代码文件路径，为定位源码文件
    func filePath() -> String
    /// 算法核心逻辑
    func run(with param: T) -> String
}

public extension AlgorithmNode {
    
    func codeRawUrl() -> URL? {
        guard let file = filePath().split(separator: "Algorithm").last else { return nil }
        let base = "https://raw.githubusercontent.com/RobinTring/Algorithm/refs/heads/main/Sources/Algorithm"
        return URL(string: base.appending(file))
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
