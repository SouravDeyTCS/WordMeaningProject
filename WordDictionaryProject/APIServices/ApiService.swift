//
//  ApiService.swift
//  AcronymDetailsProject
//
//  Created by User on 17/07/23.
//

import UIKit

class ApiService: NSObject {
    
    func getWordDetails(with searchText: String, completion: @escaping (WordElement) -> ()) {
        let url = URL(string: ApiURL.baseURL.rawValue + searchText)!
        URLSession.shared.dataTask(with: url) {(data, urlResponse, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                let jsonDecoder = JSONDecoder()
                let wordData = try! jsonDecoder.decode(WordElement.self, from: data)
                completion(wordData)
            }
            
        }.resume()
    }
}
