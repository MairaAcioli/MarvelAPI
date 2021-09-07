//
//  CharactersResponse.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation
import ObjectMapper

// MARK: - CharactersResponse
class CharactersResponse: Mappable {
   
    var code: Int?
    var status, copyright, attributionText, attributionHTML: String?
    var etag: String?
    var data: DataClass?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        code <- map["code"]
        status <- map["status"]
        copyright <- map["copyright"]
        attributionText <- map["attributionText"]
        attributionHTML <- map["attributionHTML"]
        etag <- map["etag"]
        data <- map["data"]
    }
}

// MARK: - DataClass
class DataClass: Mappable {
   
    var offset, limit, total, count: Int?
    var results: [ResultCharacters]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        offset <- map["offset"]
        limit <- map["limit"]
        total <- map["total"]
        count <- map["count"]
        results <- map["results"]
    }
}

// MARK: - Result
class ResultCharacters: Mappable {
   
    var id: Int?
    var name, resultDescription: String?
    var modified: Date?
    var thumbnail: Thumbnail?
    var resourceURI: String?
    var comics, series: Comics?
    var stories: Stories?
    var events: Comics?
    var urls: [URLElement]?
    
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case resultDescription = "description"
//        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
//    }
    
    required init?(map: Map) {}
        
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        resultDescription <- map["resultDescription"]
        modified <- map["modified"]
        thumbnail <- map["thumbnail"]
        resourceURI <- map["resourceURI"]
        comics <- map["comics"]
        series <- map["series"]
        stories <- map["stories"]
        events <- map["events"]
        urls <- map["urls"]
    }
}

// MARK: - Comics
class Comics: Mappable {
    
    var available: Int?
    var collectionURI: String?
    var items: [ComicsItem]?
    var returned: Int?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        available <- map["available"]
        collectionURI <- map["collectionURI"]
        items <- map["items"]
        returned <- map["items"]
        
    }
}

// MARK: - ComicsItem
public  struct ComicsItem: Codable {
    let resourceURI: String
    let name: String
}

// MARK: - Stories
public  struct Stories: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int
}

// MARK: - StoriesItem
public struct StoriesItem: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

public enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
class Thumbnail: Mappable {

    var path: String?
    var thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        path <- map["path"]
        thumbnailExtension <- map["thumbnailExtension"]
    }
}
    
    

public enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
public struct URLElement: Codable {
    let type: URLType
    let url: String
}

public enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}
