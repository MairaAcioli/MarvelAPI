//
//  HomeRouter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 05/09/21.
//

import Foundation


public class HomeRouter: HomePresenterToRouterProtocol {
    
    static func createModule(as presentationStyle: UIModalPresentationStyle) -> UIViewController {
        
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let vc = HomeViewController(presenter: presenter)
        
        vc.modalPresentationStyle = presentationStyle
        
        return vc
        
    }
    
    
    
  
    
}



