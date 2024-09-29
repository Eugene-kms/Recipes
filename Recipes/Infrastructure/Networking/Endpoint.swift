import Foundation

struct Endpoint<T> {
    let pain: String
    let queryItems: [URLQueryItem]
    let headers: [String: String]?
    
    init(pain: String, queryItems: [URLQueryItem] = [], headers: [String : String]? = nil) {
        self.pain = pain
        self.queryItems = queryItems
        self.headers = headers
    }
}
