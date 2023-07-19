//
//  SearchViewModel.swift
//  WordDictionaryProject
//
//  Created by User on 13/07/23.
//

import UIKit

protocol SearchViewModelProtocol: AnyObject {
    func showMessagetoViewController(with msg:String)
}

class SearchViewModel: NSObject {

//MARK: - Variables Declaration
    weak var controller: SearchViewModelProtocol?
    var apiService: ApiService!
    private(set) var wordData: WordElement! {
        didSet {
            self.bindSearchViewModelToController()
        }
    }
    
    var searchText: String? {
        didSet {
            getRequestedWord()
        }
    }
    
    var bindSearchViewModelToController : (() -> ()) = {}
    
//MARK: - Methods
    override init() {
        super.init()
        self.apiService = ApiService()
        
    }
    
    func getRequestedWord() {
        self.apiService.getWordDetails(with: searchText ?? " "){ (wordData, msg) in
            if let wordDetails = wordData {
                self.wordData = wordDetails
            } else {
                self.controller?.showMessagetoViewController(with: msg)
            }
        }
    }
}
