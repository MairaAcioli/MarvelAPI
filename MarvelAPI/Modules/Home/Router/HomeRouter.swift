//
//  HomeRouter.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 05/09/21.
//

import UIKit
//
//
//public class HomeRouter: HomePresenterToRouterProtocol {
//    
//    static func createModule(as presentationStyle: UIModalPresentationStyle) -> UIViewController {
//        
//        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
//        let vc = HomeViewController(presenter: presenter)
//        
//        vc.modalPresentationStyle = presentationStyle
//        
//        return vc
//        
//    }
//    
//    
//    
//  
//    
//}
//
//
//

public class HomeRouter: HomePresenterToRouterProtocol {
    
    
static func createModule() -> UIViewController {
        
        print("HomeRouter creates the Home module.")
        let viewController = HomeViewController()
        
        
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
