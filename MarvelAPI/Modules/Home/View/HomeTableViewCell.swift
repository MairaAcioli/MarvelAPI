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
        view.layer.cornerRadius  = 10
        view.backgroundColor     = UIColor.systemPink
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
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return imageView
    }()
    
    lazy var nameCharactersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 8, y: 190, width: 184, height: 80)
        label.numberOfLines = 0
        return label
    }()
    
   

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(view)
        view.addSubview(imageCharacters)
        view.addSubview(nameCharactersLabel)
        
        NSLayoutConstraint.activate([
        
            ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
