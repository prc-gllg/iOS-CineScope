//
//  NetworkManager.swift
//  CineScope
//
//  Created by Pierce Gallego on 8/25/23.
//

import Foundation


struct MovieTitlesRequest {
    var request: URLRequest
    
    let headers = [
        "X-RapidAPI-Key": "308bf20106mshd593d8154acea25p1833bcjsn8b08aaf175eb",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    let baseURLString = "https://moviesdatabase.p.rapidapi.com"
    
    init(year: Int){
        guard var urlComponents = URLComponents(string: baseURLString.appending("/titles")) else {
            fatalError("Invalid URL")
        }
        let params: [String:Any] = [
            "year": year,
            "info": "base_info",
            "page": "1"
        ]
        
        urlComponents.queryItems = params.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        
        guard let url = urlComponents.url else {
            fatalError("Invalid URL")
        }
        
        request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = 40
    }
    
    func fetchMediaRequest(completion: @escaping(Result<FetchResults, Error>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(FetchResults.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(error))
                print(error)
            }
        }
        dataTask.resume()
    }
}
