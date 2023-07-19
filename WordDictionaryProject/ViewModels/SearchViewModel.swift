//
//  SearchViewModel.swift
//  AcronymDetailsProject
//
//  Created by User on 13/07/23.
//

import UIKit

class SearchViewModel: NSObject {

    private var apiService: ApiService!
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
    
    override init() {
        super.init()
        self.apiService = ApiService()
        
    }
    
    func getRequestedWord() {
        self.apiService.getWordDetails(with: searchText ?? " "){ (wordData) in
            self.wordData = wordData
        }
    }
}
