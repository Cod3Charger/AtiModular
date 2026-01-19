import Foundation
import Alamofire

/// Простой сетевой сервис для демонстрации Alamofire
public class NetworkService {
    public static let shared = NetworkService()
    
    private init() {}
    
    /// Пример GET запроса
    public func fetchData(from url: String) async throws -> Data {
        return try await AF.request(url)
            .serializingData()
            .value
    }
    
    /// Пример POST запроса
    public func postData(to url: String, parameters: [String: Any]) async throws -> Data {
        return try await AF.request(
            url,
            method: .post,
            parameters: parameters,
            encoding: JSONEncoding.default
        )
        .serializingData()
        .value
    }
}
