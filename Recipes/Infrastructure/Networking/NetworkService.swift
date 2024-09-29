import Foundation

enum NetworkError: Error {
    case decodeingError
    case serverError(Int)
}

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(endpoint: Endpoint<T>) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    
    private let config: NetworkConfig
    
    init(config: NetworkConfig) {
        self.config = config
    }
    
    func fetch<T: Decodable>(endpoint: Endpoint<T>) async throws -> T {
        var url = config.baseUrl.appending(path: endpoint.pain)
        
        url.append(queryItems: endpoint.queryItems)
        
        var urlRequest = URLRequest(url: url)
        
        for (key, value) in endpoint.headers ?? [:] {
            urlRequest.addValue(value, forHTTPHeaderField: key)
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.serverError(0)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodeingError
        }
    }
}
