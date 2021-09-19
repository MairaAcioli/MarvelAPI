//
//  HomeTableViewCell.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    
    lazy var view: UIView = {
        let view = UIView(frame: CGRect(x: contentView.center.x/2, y: 16, width: 200, height: 280))
//        let view = UIView()
        view.layer.cornerRadius  = 10
        view.backgroundColor     = UIColor.systemBlue
        view.layer.shadowColor   = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset  = CGSize.zero
        view.layer.shadowRadius  = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageCharacters: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.shadowColor   = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset  = CGSize.zero
        imageView.layer.shadowRadius  = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameCharactersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(view)
        view.addSubview(imageCharacters)
        view.addSubview(nameCharactersLabel)
        
        NSLayoutConstraint.activate([
            
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            imageCharacters.topAnchor.constraint(equalTo: view.topAnchor),
            imageCharacters.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            imageCharacters.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageCharacters.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            nameCharactersLabel.topAnchor.constraint(equalTo: imageCharacters.bottomAnchor, constant: 16),
            nameCharactersLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            nameCharactersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func apply(with urlString: String) {
        
        var previousUrlString: String?
        
            ImageDownloader.shared.downloadImage(with: urlString, completionHandler: { (image, cached) in
               
//                if caching || (urlString == self.previousUrlString) {
                self.imageCharacters.image = image
//                }

            }, placeholderImage: UIImage(named: "marvelTestImage"))
            
            previousUrlString = urlString
}
}
