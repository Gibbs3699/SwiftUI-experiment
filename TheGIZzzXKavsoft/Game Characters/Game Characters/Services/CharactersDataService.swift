//
//  CharactersDataService.swift
//  Game Characters
//
//  Created by TheGIZzz on 4/6/2566 BE.
//

import Foundation
import Combine

class CharactersDataService: ObservableObject {
    
    @Published var allCharacters: [String : CharactersModel] = [:]
    
    var characterSubscription: AnyCancellable?
    
    init() {
        getCharacters()
    }
    
    func getCharacters() {
    
        guard let url = URL(string: "https://league-of-legends-api1.p.rapidapi.com/champions") else { return }
        
        var request = URLRequest(url: url)

        let headers = [
            "X-RapidAPI-Key": "a8782a29ebmsh71e6f931300a16ap189d70jsnb856687d4a7f",
            "X-RapidAPI-Host": "league-of-legends-api1.p.rapidapi.com"
        ]

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        characterSubscription = NetworkingManager.download(url: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .decode(type: CharactersModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCharacters) in
//                self?.allCoins = returnedCharacters
                print("returnedCharacters: \(returnedCharacters)")
                self?.characterSubscription?.cancel()
            })
        
//        let headers = [
//            "X-RapidAPI-Key": "a8782a29ebmsh71e6f931300a16ap189d70jsnb856687d4a7f",
//            "X-RapidAPI-Host": "league-of-legends-api1.p.rapidapi.com"
//        ]
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://league-of-legends-api1.p.rapidapi.com/champions")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if let error = error {
//              print("Error with fetching films: \(error)")
//              return
//            }
//
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                print("Error with the response, unexpected status code: \(String(describing: response))")
//              return
//            }
//
//            if let data = data {
//                let filmSummary = try? JSONDecoder().decode(CharactersModel.self, from: data)
////                  print(filmSummary)
//            }
//        })
//
//        dataTask.resume()
    }
    
//    func handleOutput(output : URLSession.DataTaskPublisher.Output) throws -> Data {
//
//        guard let response = output.response as? HTTPURLResponse,
//              response.statusCode >= 200 && response.statusCode < 300  else {
//                  throw URLError(.badServerResponse)
//              }
//        return output.data
//    }
}
