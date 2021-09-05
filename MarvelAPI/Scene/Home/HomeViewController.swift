//
//  HomeViewController.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 03/09/21.
//

import UIKit

protocol DisplayLogic {
    func presentCharacters(model: [CharactersResponseModel])
}

class HomeViewController: UIViewController, DisplayLogic, UITableViewDelegate, UITableViewDataSource {
    
    
    var charactersListTableView = UITableView()
    
    var characterModel: [CharactersResponseModel] = []
    var interactor: BusinessLogic?
    
//    apenas teste request
    var repository = CharactersRepository()

//    var arrayTeste = [MarvelModel(name: "teste1", image: UIImage(named: "teste1")!), MarvelModel(name: "teste1", image: UIImage(named: "teste1")!), MarvelModel(name: "teste2", image: UIImage(named: "teste2")!), MarvelModel(name: "teste2", image: UIImage(named: "teste2")!)]
        
    let cell = HomeTableViewCell.init()

        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repository.getCharacters { [weak self] array in
            if array != nil {

            }
        }
        configurator()
        
        interactor?.fetchCharacters()
        
        setupNavigationBar()
        setupConstraints()
        
        self.view.addSubview(charactersListTableView)
        
        self.charactersListTableView.delegate = self
        self.charactersListTableView.dataSource = self
        
        self.charactersListTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configurator()
//        interactor?.fetchCharacters()
    }
    
    func presentCharacters(model: [CharactersResponseModel])  {
        self.characterModel = model
    }
    
    
    func configurator() {
        let viewController = HomeViewController()
        let presenter = HomePresenter(viewController: viewController)
        let interactor = HomeInteractor(presenter: presenter, repository: CharactersRepository())
        viewController.interactor = interactor 
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
        interactor?.fetchCharacters()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

