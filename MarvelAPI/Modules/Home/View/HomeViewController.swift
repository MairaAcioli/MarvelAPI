//
//  HomeViewController.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit


class HomeViewController: UIViewController {
    
    weak var presenter: HomeViewToPresenterProtocol?
    var characterModel: CharactersResponseModel? = nil
        
    var charactersListTableView = UITableView()
    
    var charactersSearchBar =  UISearchBar()
    var filterCharacter: [String] = []

    
    let cell = HomeTableViewCell.init()
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.requestFirstCallOfCharacters()
        
        setupNavigationBar()
        setupConstraints()
        setupSearchBar()
        setupDelegate()
        
        self.view.addSubview(charactersListTableView)
        
        self.charactersListTableView.register(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCell")
        self.charactersListTableView.separatorStyle = .none
        self.charactersListTableView.backgroundColor = .white
        self.charactersListTableView.allowsSelection = false

      
    }
    
    
    func setupDelegate(){
        
        self.charactersSearchBar.delegate = self
        
        self.charactersListTableView.delegate = self
        self.charactersListTableView.dataSource = self
        
    }
    
    
    func setupConstraints() {
        
        self.charactersListTableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.charactersSearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: charactersListTableView.frame.size.width, height: 44.0))
        
        self.charactersListTableView.tableHeaderView = charactersSearchBar
        
        
    }
    
    
    func setupNavigationBar() {
        
        navigationItem.title = "Marvel Characters"
        guard let navBar = navigationController?.navigationBar else {return}
        navBar.barTintColor = .systemPink
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return characterModel?.data?.results?.count ?? 0
        return 19
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.imageCharacters.image = UIImage(named: "marvelTestImage")

        cell.nameCharactersLabel.text = characterModel?.data?.results?[indexPath.row].name
    
//        cell.nameLabel.text =
//        for i in characterModel {
//            cell.update(model: i)
//        }
        
        return cell
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return cell.view.frame.height + 32
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

extension HomeViewController: UISearchBarDelegate {
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        var arrayName = [String]()
        guard let arrayNamesCharacters = characterModel?.data?.results else {return}

        for value in arrayNamesCharacters {
            arrayName.append(value.name ?? "")
        }
        
     
        self.filterCharacter = []
        
        if searchText.isEmpty {
            self.filterCharacter = arrayName
        }else{
            
            for name in arrayName {
                if ((name.uppercased().contains(searchText.uppercased()))){
                    self.filterCharacter.append(name)
                }
            }
        }
        
        self.charactersListTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    
    
}
//}

extension HomeViewController: HomePresenterToViewProtocol {
    
    
    
    func showCharacterResults(model: CharactersResponseModel) {
        self.characterModel = model
    }
    
    
    //    func problemOnFetchingData(error: errorTypes) {
    //
    //        ///Show Alert with problem
    //
    //    }
    
}

