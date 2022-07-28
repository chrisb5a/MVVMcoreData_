//
//  MusicViewModel.swift
//  CoreDataMVVM3
//
//  Created by CHRISTIAN BEYNIS on 7/24/22.
//

import Foundation

//protocol MusicModelType{
//
//
//    func bind(updateHandler: @escaping ()-> Void)
//    func getAlbums()
//    var count: Int {get}
//    func AlbumTitle(for index: Int) -> String?
//
//    func musicImage(for index: Int, completion: @escaping (Data?) -> Void)
//
//}



protocol MusicModelCore{
     
     func bind(updateHandler: @escaping ()-> Void)
     func getAlbums()
     
}

protocol MusicModelAttribute{
     
     var count: Int {get}
     func AlbumTitle(for index: Int) -> String?
     
     func musicImage(for index: Int, completion: @escaping (Data?) -> Void)
     
}

typealias MusicModelType = MusicModelCore & MusicModelAttribute

class MusicViewModel : MusicModelType{
    
    var AlbumInfo: [Result] = []{
        
    didSet{
        self.updateHandler?()
    }}
    
    private var networkManager: NetworkManager
    
    //private var pageCount = 1
    //Page count not needed for pagination? Is there any?
    
    private var updateHandler: (()-> Void)?
    
    init(networkManager: NetworkManager){
        self.networkManager = networkManager
    }
    
    
    
  
    
}


extension MusicViewModel {
     
     func bind(updateHandler: @escaping ()-> Void) {
         self.updateHandler = updateHandler
         
     }
     
     func getAlbums() {
         
         
         self.networkManager.fetchPage(urlStr: NetworkParams.Top100.urlStr ?? ""){
             (result: Swift.Result<Itunes100, NetworkError>) in
             switch result{
             case .success(let data):
                 //self.pageCount += 1
                 DispatchQueue.main.async {
                     self.AlbumInfo.append(contentsOf: data.feed.results)
                      //print(data.feed.results[3].artworkUrl100)
                 }
             case .failure(let error):
                 print(error)
             
             }
         }
     }
     
}

extension MusicViewModel{
     
     var count: Int {
         return self.AlbumInfo.count
         
     }
     
     func AlbumTitle(for index: Int) -> String? {
         
         guard index < self.count else {return nil}
         return self.AlbumInfo[index].name
         
     }
     
     func musicImage(for index: Int, completion: @escaping (Data?) -> Void) {
         
         guard index < self.count else {
             completion(nil)
             return }
          let ArtWorkPath = self.AlbumInfo[index].artworkUrl100
         
          if let imageData = ImageCache.shared.getImageData(key:ArtWorkPath){
               completion(imageData)
               return
          }
          self.networkManager.getImageData(urlStr: NetworkParams.AlbumImage(ArtWorkPath).urlStr ?? ""){ (result: Swift.Result<Data, NetworkError>) in
               switch result {
                    
               case .success(let ImageData):
                    print("HHHHHHHHHHHHHEEEEEEEEEEERRRRRRRREEEEEE", ImageData)
                    ImageCache.shared.setImageData(data: ImageData, key: ArtWorkPath)
                    completion(ImageData)
               case .failure(let error):
                    print("NNNNNOOOOOOOOOOOOOOO WWWWWWWWWWWAAAAAAAAYYYYYYY", ArtWorkPath)
                    
                    print(error)
                    
               }
          }
         
     }
     
     
}

