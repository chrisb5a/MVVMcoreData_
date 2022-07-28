//
//  NetworkManager.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//


import Foundation


class NetworkManager {
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
}

extension NetworkManager {

    func fetchPage<T: Decodable>(urlStr: String, completion: @escaping (Swift.Result<T, NetworkError>) -> Void) {

        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in

            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }

//            if let hResponse = response as? HTTPURLResponse, !(200..<300).contains(hResponse.statusCode) {
//                completion(.failure(NetworkError.serverResponse(hResponse.statusCode)))
//                return
//            }

            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }


            do {
                let page = try JSONDecoder().decode(T.self, from: data)
                completion(.success(page))
                //print(page)
            } catch {
                completion(.failure(NetworkError.other(error)))
            }

        }.resume()

    }
    
    func getImageData(urlStr: String, completion: @escaping (Swift.Result<Data, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
//            if let hResponse = response as? HTTPURLResponse, !(200..<300).contains(hResponse.statusCode) {
//                completion(.failure(NetworkError.serverResponse(hResponse.statusCode)))
//                return
//            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
            completion(.success(data))
            
        }.resume()
        
        
    }
    
    
    
    
}
