//
//  HomeProtocols.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit


protocol HomeBusinessProtocol: class {
    func fetchCharacters()
}

protocol HomePresentationLogic: class {
    func returnCharacterResult(model: CharactersResponseModel)
}

protocol HomeDisplayLogic: class {
    func showCharacterResults(model: [CharactersDetailViewModel])
}

