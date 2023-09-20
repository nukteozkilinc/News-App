//
//  Network Layer.swift
//  News App
//
//  Created by Nukte Ozkilinc on 11.09.2023.
//
import Foundation
import Alamofire


enum EndPoint {
    case getNews
    case searchNews
    case filterNews
}

enum HTTPMethod: String {
    case get
}

protocol EndpointProtocol {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    func request (additionalQuery: String?, categoryQuery: String?) -> URLRequest
}

extension EndPoint: EndpointProtocol {
 
    var parameters: Alamofire.Parameters? {
        
        switch self {
        case .getNews:
            return [
                "apiKey": "dc2e3e80467748aba70f9420250da9f6",
                "country":"us"
            ]
        case .searchNews:
            return [
                "apiKey": "dc2e3e80467748aba70f9420250da9f6",
                "country":"us"
            ]
        case .filterNews:
            return [
                "apiKey": "dc2e3e80467748aba70f9420250da9f6",
                "country":"us"
            ]
        }
    }
    
    var baseUrl: String {
        return "https://newsapi.org"
    }
    
    var path: String {
        switch self {
        case .getNews : return "/v2/top-headlines"
        case .searchNews : return "/v2/top-headlines"
        case .filterNews : return "/v2/top-headlines"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getNews : return .get
        case .searchNews : return .get
        case .filterNews : return .get
        }
    }
    
    func request(additionalQuery: String? = nil, categoryQuery: String? = nil) -> URLRequest {
        guard var component = URLComponents(string: baseUrl) else{
            fatalError("Invalid URL")
        }
        component.path = path
        if method == .get {
            component.queryItems = []
            parameters?.forEach({ key,value in
                guard let valueStr = value as? String else {
                    return
                }
                component.queryItems?.append(.init(name: key, value: valueStr))
            })
        }
        
        if let additionalQuery {
            component.queryItems?.append(.init(name: "q", value: additionalQuery))
        }
        
        if let categoryQuery {
            component.queryItems?.append(.init(name: "category", value: categoryQuery))
        }
        
        var request = URLRequest(url: component.url!)
        request.httpMethod = method.rawValue

        return request
    }
}

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request <T:Decodable> (_ endpoint: EndPoint, additionalQuery: String? = nil, categoryQuery: String? = nil, completion: @escaping (Result<T, Error>) -> Void) -> Void{
        AF.request(endpoint.request(additionalQuery: additionalQuery,categoryQuery: categoryQuery)).response{ response in
            if let data = response.data{
                do{
                    let news = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(news))
                }catch{
                    completion(.failure(error))
                }
            }
        }
    }
    
    func getNews(completion: @escaping (Result<News , Error>) ->Void) -> Void {
        let endpoint = EndPoint.getNews
        request(endpoint, completion: completion)
       }
    
    func searchNews(searchText: String, completion: @escaping (Result<News , Error>) -> Void ) -> Void {
        let endpoint = EndPoint.searchNews
        //endpoint.search = "NASA"
        request(endpoint,additionalQuery: searchText ,completion: completion)
    }
    
    func filterNews(categoryText: String, completion: @escaping (Result<News , Error>) -> Void ) -> Void {
        let endpoint = EndPoint.filterNews
        request(endpoint, categoryQuery: categoryText, completion: completion)
    }
}
