//
//  HomeViewController.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit


class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var presenter: HomeViewToPresenterProtocol?
//    private var refreshControl: UIRefreshControl?
    
    //MARK: - Sets the StatusBar as white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return UIStatusBarStyle.lightContent
    }
    
    init(presenter: HomeViewToPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var charactersListTableView = UITableView()
//    var characterModel: CharactersResponseModel
//    var interactor: BusinessLogic?
    
//    apenas teste request
    var repository = CharactersRepository()

//    var arrayTeste = [MarvelModel(name: "teste1", image: UIImage(named: "teste1")!), MarvelModel(name: "teste1", image: UIImage(named: "teste1")!), MarvelModel(name: "teste2", image: UIImage(named: "teste2")!), MarvelModel(name: "teste2", image: UIImage(named: "teste2")!)]
        
    let cell = HomeTableViewCell.init()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        repository.getCharacters { [weak self] array in
//            if array != nil {
//
//            }
//        }
        
        presenter?.requestFirstCallOfCharacters()
        
        configurator()
        
        setupNavigationBar()
        setupConstraints()
        
        self.view.addSubview(charactersListTableView)
        
        self.charactersListTableView.delegate = self
        self.charactersListTableView.dataSource = self
        self.charactersListTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
//    func presentCharacters(model: [CharactersResponseModel])  {
//        self.characterModel = model
//    }
    
    
    func configurator() {
        let presenter = HomePresenter()
        let viewController = HomeViewController(presenter: presenter)
        _ = HomeInteractor(presenter: presenter, repository: CharactersRepository())
        viewController.presenter = presenter
    }
    
    func setupConstraints() {
        charactersListTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
    }
    
    
    func setupNavigationBar() {
        
        navigationItem.title = "Marvel Characters"
        guard let navBar = navigationController?.navigationBar else {return}
        navBar.barTintColor = .systemPink
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

//        return characterModel.count
        return 5
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
//        cell.nameLabel.text =
//        for i in characterModel {
//            cell.update(model: i)
//        }
        
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.frame.height*0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension HomeViewController: HomePresenterToViewProtocol {
    
    func showCharacterResults(model: CharactersResponseModel) {
//        self.characterModel = model
    }
    
    
//    func problemOnFetchingData(error: errorTypes) {
//
//        ///Show Alert with problem
//
//    }
    
}
