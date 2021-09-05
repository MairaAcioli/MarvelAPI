//
//  HomeInteractor.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 03/09/21.
//

import Foundation

protocol BusinessLogic {
    func fetchCharacters()
}

class HomeInteractor: BusinessLogic {
    
    let repository: CharactersRepositoryProtocol?
    var presenter: HomePresentationLogic?
    
    init(presenter: HomePresentationLogic, repository: CharactersRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
    }
    
    
    func fetchCharacters() {
    
     
        repository?.getCharacters(completion: { (result) in
            
            switch result {
            
            case .success(let model):
                let resultCharactersModel: [CharactersResponseModel] = [CharactersResponseModel](_immutableCocoaArray: model)
                self.presenter?.presentSucess(model: resultCharactersModel)
               
            case .failure(_): break
            
                
            
            }
            
            
        })
        

//            switch result {
//
//            case .sucess(let model):
//                let charactersModel: CharactersModel = CharactersModel(response: model)
//
//            case .failure(_):
//                let responseError = nil
//
//            }
//        })
    }
    
    
}
