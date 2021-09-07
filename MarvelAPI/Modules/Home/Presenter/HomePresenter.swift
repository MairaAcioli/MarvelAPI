//
//  HomePresenter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation


class HomePresenter: HomeViewToPresenterProtocol {
    
    ///Layer instances
    var view: HomePresenterToViewProtocol?
    var interactor: HomePresenterToInteractorProtocol?
    var router: HomePresenterToRouterProtocol?
    
    ///Local Data Arrays
    private var charactersModel = CharactersResponseModel()
    
//    func getCharacters(model:CharactersResponseModel) {
//        guard let data = model.data else {return}
//        let result = data.results
//
//    }
    
    func requestFirstCallOfCharacters() {
        
        var array = charactersModel.data?.results
        array?.removeAll()
        
        interactor?.fetchCharacters()
        
    }
    
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
    func returnCharacterResult(model: CharactersResponseModel) {
        view?.showCharacterResults(model: model)
    }
    
//    func problemOnFetchingData(error: errorTypes) {
//        view?.problemOnFetchingData(error: error)
//
//    }
}
