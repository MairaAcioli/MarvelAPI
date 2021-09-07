//
//  HomeInteractor.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    let repository: CharactersRepositoryProtocol?
    var presenter: HomeInteractorToPresenterProtocol?
    
    init(presenter: HomeInteractorToPresenterProtocol, repository: CharactersRepositoryProtocol) {
        self.presenter = presenter
        self.repository = repository
    }
    
    
    func fetchCharacters() {
        
        repository?.getCharacters(completion: { (result) in
            
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
