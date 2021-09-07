//
//  HomeInteractor.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    func fetchCharacters() {
        
        let repository = CharactersRepository()
        
        repository.getCharacters(completion: { (result) in
            
            switch result {
            
            case .success(let model):
                let resultCharactersModel: CharactersResponseModel = CharactersResponseModel(response: model)
                self.presenter?.returnCharacterResult(model: resultCharactersModel)
                
            case .failure(_): break
//                self.presenter?.problemOnFetchingData(error: error)
            }
        })
    }
}
