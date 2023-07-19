//
//  ApiService.swift
//  WordDictionaryProject
//
//  Created by User on 17/07/23.
//

import UIKit

class ApiService: NSObject {
    
    func getWordDetails(with searchText: String, completion: @escaping (WordElement?, String) -> ()) {
        let url = URL(string: ApiURL.baseURL.rawValue + searchText)!

        URLSession.shared.dataTask(with: url) {(data, urlResponse, error) in
    
            if let error = error {
                print(error.localizedDescription)
                completion(nil, Messages.ResponseError)
            } else if
                let data = data,
                let response = urlResponse as? HTTPURLResponse,
                response.statusCode == 200 {
                let jsonDecoder = JSONDecoder()
                let wordData = try! jsonDecoder.decode(Word.self, from: data)
                completion(wordData[0], Messages.successmessage)
            } else {
                completion(nil, Messages.requestNotFound)
            }
            
        }.resume()
    }
}
