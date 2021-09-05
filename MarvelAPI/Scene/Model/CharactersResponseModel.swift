//
//  CharactersResponseModel.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 03/09/21.
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
    
    init(response: ResultCharacters? = nil) {
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
}

//class ThumbnailModel {
//
//    var path: String?
//    var thumbnailExtension: Extension?
//
//    init(path: String?, thumbnailExtension: Extension?) {
//        self.path = path
//        self.thumbnailExtension = thumbnailExtension
//    }
//}

//    var id: Int
//    var name: String
//    var description: String
//    var thumbnail: [String:String]
//    var urls: [[String:String]]
