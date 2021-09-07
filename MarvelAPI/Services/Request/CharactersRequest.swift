//
//  CharactersRequest.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation
import CryptoKit


class CharactersRequest {
    
    let publicKey = "0e4f406e2004a1e0cbd2c847152af817"
    let privateKey = "52f02ea1a958ff1b342366eea8f83f1a79e09046"
    var ts = String(Date().timeIntervalSince1970)
    
    var hash: String {
        return MD5(data: "\(ts)\(privateKey)\(publicKey)")
    }
    
    var url: String {
        return "https://gateway.marvel.com:443/v1/public/characters?ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    
    func MD5(data: String) -> String {
        let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
        
        return hash.map {
            String(format: "%02hhx", $0)
        }
        .joined()
    }
}
