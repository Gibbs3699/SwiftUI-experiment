//
//  NetworkingManager.swift
//  Game Characters
//
//  Created by TheGIZzz on 6/6/2566 BE.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL, header: [String : String]? = nil, requestMethod: String? = nil) -> AnyPublisher<Data, any Error> {
        
        guard let header = header, let requestMethod = requestMethod else {
            return URLSession.shared.dataTaskPublisher(for: url)
    //            .subscribe(on: DispatchQueue.global(qos: .default)) app will handle this
                .tryMap( { try handleURLResponse(output: $0, url: url)})
                .retry(3)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod
        request.allHTTPHeaderFields = header
        
        return URLSession.shared.dataTaskPublisher(for: request)
//            .subscribe(on: DispatchQueue.global(qos: .default)) app will handle this
            .tryMap( { try handleURLResponse(output: $0, url: url)})
            .retry(3)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
//        throw NetworkingError.badURLResponse(url: url)
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
