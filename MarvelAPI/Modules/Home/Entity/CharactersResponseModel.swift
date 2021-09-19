//
//  CharactersResponseModel.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation

class CharactersResponseModel {

     var code: Int?
     var status, copyright, attributionText, attributionHTML: String?
     var etag: String?
     var data: DataClass?

     init(response: CharactersResponse? = nil) {
         self.code = response?.code
         self.status = response?.status
         self.copyright = response?.copyright
         self.attributionText = response?.attributionText
         self.attributionHTML = response?.attributionHTML
         self.etag = response?.etag
         self.data = response?.data
     }

 }

class DataClassModel {

    var offset: Int?
    var limit: Int?
    var total: Int?
    var count: Int?
    var results: [ResultCharacters]?

    init(response: DataClass) {
        self.offset = response.offset
        self.limit = response.limit
        self.total = response.total
        self.count = response.count
        self.results = response.results
    }
}


 class ResultCharactersModel {

     var id: Int?
     var name, resultDescription: String?
     var modified: Date?
     var thumbnail: Thumbnail?
     var resourceURI: String?
     var comics, series: Comics?
     var stories: Stories?
     var events: Comics?
     var urls: [URLElement]?

    public init(response: ResultCharacters? = nil) {
         self.id = response?.id
         self.name = response?.name
         self.resultDescription = response?.resultDescription
         self.modified = response?.modified

         self.thumbnail = response?.thumbnail

         self.resourceURI = response?.resourceURI
         self.comics = response?.comics
         self.series = response?.series
         self.stories = response?.stories
         self.events = response?.events
         self.urls = response?.urls

     }
    
//    func getLink(to type: MarvelUrlType) -> MarvelUrl? {
//        return urls.filter { (url) -> Bool in
//            return url.type == type
//        }.first ?? nil
//        
 }

//enum MarvelUrlType: String, Codable {
//    case detail = "detail"
//    case comiclink = "comiclink"
//    case wiki = "wiki"
//}
//
//struct MarvelUrl: Codable {
//    var type: MarvelUrlType
//    var url: String
//}
//
//
//class ThumbnailModel {
//
//    var path: String?
//    var thumbnailExtension: Extension?
//
//    init(response: Thumbnail? = nil) {
//        self.path = response?.path
//        self.thumbnailExtension = response?.thumbnailExtension
//
//        enum Extension: String, Codable {
//            case gif = "gif"
//            case jpg = "jpg"
//        }
//    }
//
//    func urlPath(type: ThumbnailType)-> String {
//        return "\(String(describing: path))/\(type.rawValue).\(Extension.jpg)"
//    }
//}
