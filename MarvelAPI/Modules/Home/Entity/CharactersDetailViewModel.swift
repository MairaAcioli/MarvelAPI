//
//  CharactersDetailViewModel.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 17/09/21.
//

import UIKit
import Foundation


public struct CharactersDetailViewModel {
    
    let name: String?
    let description: String?
    let url: String?
    
    var image: UIImage?
    var imageView: UIImageView?
    
    var imageDownloader: ImageDownloader? = nil
    
    
    func returnImage() {
    
        ImageDownloader.shared.downloadImage(with: url, completionHandler: { (image, cached) in
            
            imageView?.image = image

        }, placeholderImage: UIImage(named: "marvelTestImage"))
    }
    
//    var imageView: UIImageView?
//    
//    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
//        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
//    }
//    
//    func downloadImage(from url: URL) {
//        print("Download Started")
//        getData(from: url) { data, response, error in
//            guard let data = data, error == nil else { return }
//            print(response?.suggestedFilename ?? url.lastPathComponent)
//            print("Download Finished")
//            // always update the UI from the main thread
//            DispatchQueue.main.async() { [self] in
//                self.imageView?.image = UIImage(data: data)
//            }
//        }
//
//    }
    
    // data task
//    URLSession.shared.dataTask(with: url) { [self] data, response, error in
//        guard let data = data else {
//            return
//        }
//        DispatchQueue.main.async {
//            self?.imageView.image = UIImage(data: data)
//        }
//    } .resume()
//
//    return image(d)
//    }
}


