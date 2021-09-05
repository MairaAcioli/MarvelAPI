//
//  HomePresenter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 03/09/21.
//


import Foundation

protocol HomePresentationLogic {
    func presentSucess(model: [CharactersResponseModel])
}

class HomePresenter: HomePresentationLogic {
    
    var viewController: DisplayLogic?
    
    init(viewController: DisplayLogic) {
        self.viewController = viewController
    }
    
    func presentSucess(model: [CharactersResponseModel]) {
        self.viewController?.presentCharacters(model: model)
    }
}

