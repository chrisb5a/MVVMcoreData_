//
//  NetworkParams.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let Top100Base = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
        //static let baseImage = "https://is4-ssl.mzstatic.com/image/thumb/Music112/v4/"
        //static let key = "705f7bed4894d3adc718c699a8ca9a4f"
        
    }
    
    
    case Top100
    case AlbumImage(String)
    
    var urlStr: String? {
        switch self {
        case .Top100:
            return NetworkConstants.Top100Base
            
//            var component = URLComponents(string: NetworkConstants.Top100Base)
//            component?.queryItems = [URLQueryItem(name: "api_key", value: NetworkConstants.key),
//                                     URLQueryItem(name: "language", value: "en-US"),
//                                     URLQueryItem(name: "page", value: "\(page)")]
//            return component?.url
        case .AlbumImage(let ArtworkPath):
            print("Heeeerrreeee" ,ArtworkPath, "OOOOOkkkkkkkk, HHHHeeeeeerrrrrreeee")
            return  ArtworkPath
//            let baseURL = URL(string: NetworkConstants.baseImage)
//            return URL(string: posterPath, relativeTo: baseURL)
        }
    }
    
}
