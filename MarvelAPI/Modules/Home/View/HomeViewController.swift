//
//  HomeViewController.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit


class HomeViewController: UIViewController {
    
    var interactor: HomeBusinessProtocol?
    var characterModel: [CharactersDetailViewModel]?
    var charactersListTableView = UITableView()
    var charactersSearchBar =  UISearchBar()
    var filterCharacter: [String] = []
    let cell = HomeTableViewCell.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.charactersListTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        setupNavigationBar()
        setupTableView()
        setupConstraints()
        setupSearchBar()
        setupDelegate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupConfig()
        interactor?.fetchCharacters()
    }
    
    func setupConfig(){
        let viewController = self
        let presenter = HomePresenter(viewController: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        self.interactor = interactor
    }
    
    func setupDelegate(){
        self.charactersSearchBar.delegate = self
        self.charactersListTableView.delegate = self
        self.charactersListTableView.dataSource = self
    }
    
    func setupConstraints() {
        charactersSearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: charactersListTableView.frame.size.width, height: 44.0))
        
        charactersListTableView.tableHeaderView = charactersSearchBar
        charactersListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            charactersListTableView.topAnchor.constraint(equalTo: view.topAnchor),
            charactersListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            charactersListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            charactersListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Marvel Characters"
        guard let navBar = navigationController?.navigationBar else {return}
        navBar.barTintColor = .systemPink
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    func setupTableView() {
        self.view.addSubview(charactersListTableView)
        self.charactersListTableView.separatorStyle = .none
        self.charactersListTableView.backgroundColor = .white
        self.charactersListTableView.allowsSelection = false
        self.charactersListTableView.showsVerticalScrollIndicator = false
    }
    
    func setupSearchBar() {
        charactersSearchBar.barTintColor = .systemYellow
        charactersSearchBar.tintColor = .systemPink
        charactersSearchBar.showsCancelButton = true
        charactersSearchBar.placeholder = "search Character"
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        interactor?.fetchCharacters()
        
        if let character = characterModel?[indexPath.row] {
            cell.setupCell(model: character)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cell.view.frame.height + 32
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.charactersListTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: HomeDisplayLogic {
    
    func showCharacterResults(model: [CharactersDetailViewModel]) {
        self.characterModel = model
    }
}

