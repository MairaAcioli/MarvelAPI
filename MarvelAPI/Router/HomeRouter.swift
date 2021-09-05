//
//  HomeRouter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 05/09/21.
//

import Foundation


public class HomeRouter: NSObject {

    
    class func firstController(){
        
        let viewController = HomeViewController()
        let presenter = HomePresenter(viewController: viewController)
        let interactor = HomeInteractor(presenter: presenter, repository: CharactersRepository())
        viewController.interactor = interactor
        
        
    }
    
}



