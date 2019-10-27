//
//  NetworkService.swift
//  JSON
//
//  Created by Gor Grigoryan on 10/27/19.
//  Copyright © 2019 Gor Grigoryan. All rights reserved.
//

import Foundation

class NetworkService {
    func request(urlString: String, completion: @escaping (Result<SearchResponse, Error>) -> Void) {
        // create url with address, specified in urlString constant
        guard let url = URL(string: urlString) else { return }
        
        // activate url with urlSession
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // for example, when we have low internet, it is possible our interface is hang out
            // to avoid this problem, our action working asynchronous
            DispatchQueue.main.async {
                if let error = error {
                    print("some error")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let tracks = try JSONDecoder().decode(SearchResponse.self, from: data)
                    completion(.success(tracks))
                } catch let jsonError {
                    print("Failed to decode JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
            }.resume() // without resume() our url is inactive
    }
}
