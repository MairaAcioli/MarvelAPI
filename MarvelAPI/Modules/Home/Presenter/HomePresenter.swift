//
//  HomePresenter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation
import ObjectMapper


class HomePresenter: HomePresentationLogic {
    
    ///Layer instances
    var viewController: HomeDisplayLogic?
    
    init(viewController: HomeDisplayLogic) {
        self.viewController = viewController
    }
    
//    func requestFirstCallOfCharacters() {
//
//        interactor?.fetchCharacters()
//
//    }
    
    
    func returnCharacterResult(model: CharactersResponseModel) {
        
        let results = model.data?.results.map({(modelResult) -> [CharactersDetailViewModel] in
         
            var characterDetailViewModel: [CharactersDetailViewModel] = []
            
            for item in modelResult {
                
                var model = CharactersDetailViewModel(name: item.name, description: item.resultDescription, url: item.thumbnail?.urlPath(type: .landscapeLarge))
                characterDetailViewModel.append(model)
            }
            
            return characterDetailViewModel
          
        })
    
        guard let characterResults = results else {
            return
        }
        viewController?.showCharacterResults(model: characterResults)
    }
    
//    func problemOnFetchingData(error: errorTypes) {
//        view?.problemOnFetchingData(error: error)
//
//    }
}
