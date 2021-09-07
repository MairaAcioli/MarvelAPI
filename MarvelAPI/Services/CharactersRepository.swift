//
//  CharactersRepository.swift
//  MarvelAPI
//
//  Created by Maira Preto Acioli de Siqueira on 07/09/21.
//

import Foundation
import Combine
import ObjectMapper

typealias CharactersResponseCompletionResult = ((Result<CharactersResponse, NSError>) -> Void)

//protocol CharactersRepositoryProtocol {
//    func getCharacters(completion: @escaping CharactersResponseCompletionResult)
//}

class CharactersRepository {
    
    let request = CharactersRequest()
    static let shared = CharactersRequest()
    
    func getCharacters(completion: @escaping CharactersResponseCompletionResult) {
        
        let urlRequest = request.url
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: URL(string: urlRequest)!, completionHandler: { (data, response, error) in
            
            if let error = error {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["message": error.localizedDescription])))
                return
            }
            
            guard let APIData = data else {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["message": "Can't get data"])))
                return
            }
            
            guard let jsonParse = self.parseData(rawData: APIData) else {
                completion(.failure(NSError(domain: "", code: 000, userInfo: ["message": "Can't parse json"])))
                return
            }
            
            guard let responseObject = Mapper<CharactersResponse>().map(JSON: jsonParse) else {
                return
            }
            
            completion(.success(responseObject))
        })
        
        task.resume()
    }
    
    
    typealias StringObjectArrayDataFormat = [String : Any]
    
    
    func parseData(rawData: Data) -> StringObjectArrayDataFormat? {
        
        do {
            if let json = try JSONSerialization.jsonObject(with: rawData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as? StringObjectArrayDataFormat {
                return json
                
            } else {
                print("cannot serialize data returned in especified format")
            }
        } catch let error as NSError {
            print(error.description)
        }
        
        return nil
    }
}
