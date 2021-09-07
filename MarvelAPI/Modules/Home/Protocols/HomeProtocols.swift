//
//  HomeProtocols.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit

protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
//    func getMovies(page: Int, category: Constants.category, movieSelection: Constants.MovieSelection)
//    func numberOfSections() -> Int
//    func getNumberOfRowsInSection(section: Int) -> Int
//    func loadMovieArrayWithIndexPath(indexPath: IndexPath) -> [Movie]
//    func loadMovieWithIndexPath(indexPath: IndexPath) -> Movie
//    func getCategoryName(section: Int) -> String
//    func getSelectionWithSection(section: Int) -> Constants.MovieSelection
    func requestFirstCallOfCharacters()
//    func showMovie(indexPath: IndexPath)
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchCharacters()
}

protocol HomeInteractorToPresenterProtocol: class {
    func returnCharacterResult(model: CharactersResponseModel)
//    func problemOnFetchingData(error: errorTypes)
}

protocol HomePresenterToViewProtocol: class {
    var presenter: HomeViewToPresenterProtocol? { get set }
    func showCharacterResults(model: CharactersResponseModel)
//    func problemOnFetchingData(error: errorTypes)
}

protocol HomePresenterToRouterProtocol: class {
//    static var mainstoryboard: UIStoryboard { get }
//    static func createModule(as presentationStyle: UIModalPresentationStyle) -> UIViewController
//    func goToMovieDetailsViewController(movie: Movie, for view: UIViewController)
    
    static func createModule() -> UIViewController
}
