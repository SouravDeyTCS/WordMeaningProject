//
//  Constants.swift
//  WordDictionaryProject
//
//  Created by User on 13/07/23.
//

import Foundation
import UIKit

enum ApiURL: String {
    case baseURL = "http://api.dictionaryapi.dev/api/v2/entries/en/"
}

enum cellIdentifier: String {
    case WordMeaningCell = "WordTableViewCell"
}

enum Messages {
    
    /// API errors message
    static let noInternet = "Internet appears to be offline. Try again after some times"
    static let ResponseError = "Cloud server is not responding. Try again after some times"
    static let requestNotFound = "Defination not found not found"
    static let successmessage = "Successful"
    
}


