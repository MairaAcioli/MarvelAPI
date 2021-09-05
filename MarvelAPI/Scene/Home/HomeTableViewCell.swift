//
//  HomeTableViewCell.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 03/09/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    
    
//    var imageCharacters: UIImageView!
    
    lazy var view: UIView = {
        let view = UIView()
        view.layer.cornerRadius  = 10
        view.backgroundColor     = UIColor.orange
        view.layer.shadowColor   = UIColor.black.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset  = CGSize.zero
        view.layer.shadowRadius  = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageCharacters: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius  = 10
        imageView.backgroundColor     = UIColor.orange
        imageView.layer.shadowColor   = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset  = CGSize.zero
        imageView.layer.shadowRadius  = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameCharactersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "teste personagem marvel"
        label.tintColor = .purple
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageCharacters, nameCharactersLabel])
        stack.spacing = 24
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
//    class Model {
//
//        var code: Int?
//        var status, copyright, attributionText, attributionHTML: String?
//        var etag: String?
//        var data: DataClass?
//    }
//
//    var model: Model? {
//        didSet {
//         update()
//        }
//    }
//
//    //teste objeto
//    func update() {
//        guard let model = model else {return}
//        nameLabel.text = model.copyright
//
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        let margin: CGFloat = 16
//        let sizeWidth: CGFloat = 250
//        let sizeHeight: CGFloat = 150
//
//        NSLayoutConstraint.activate ([
//
//                   view.widthAnchor.constraint(equalToConstant: sizeWidth),
//                   view.heightAnchor.constraint(equalToConstant: sizeHeight),
//                   view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: margin),
//                   view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -margin),
//                   view.topAnchor.constraint(equalTo: topAnchor, constant: margin),
//                   view.centerXAnchor.constraint(equalTo: centerXAnchor),
//                   view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -margin)
//               ])
        
        
        
        
        let screenSize = UIScreen.main.bounds
        let width = screenSize.width
        let height = screenSize.height*0.2
//        20% da tela *0.2

        self.imageCharacters = UIImageView(frame: CGRect(x: width*0.05, y: width*0.05, width: height*0.6, height: height*0.9))
        self.imageCharacters.center.y = height/2
        
        self.imageCharacters.contentMode = .scaleToFill
        
        self.nameLabel = UILabel(frame: CGRect(x: width*0.7, y: 0, width: width*0.3, height: height/2))
        self.nameLabel.center.y = height/2
//
        self.addSubview(view)
        self.addSubview(stack)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
