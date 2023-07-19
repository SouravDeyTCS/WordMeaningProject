//
//  SearchViewController.swift
//  WordDictionaryProject
//
//  Created by User on 13/07/23.
//

import UIKit

class SearchViewController: UIViewController {

//MARK: - Outlet Object Declaration
    @IBOutlet weak var wordDetailsTableview: UITableView!
    @IBOutlet weak var wordSearchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//MARK: - Variables Declaration
    private var serachViewModel: SearchViewModel!
    
    private var dataSource: WordTableViewDataSource<WordTableViewCell, Meaning>!
    
//MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        wordDetailsTableview.estimatedRowHeight = 40
        wordDetailsTableview.rowHeight = UITableView.automaticDimension
        activityIndicator.isHidden = true
        callToViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate() {
        self.serachViewModel = SearchViewModel()
        self.serachViewModel.controller = self
        self.serachViewModel.bindSearchViewModelToController = {
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.activityIndicator.stopAnimating()
                self.updateDataSource()
            }
            
        }
    }
    
    func updateDataSource() {
        self.dataSource = WordTableViewDataSource(cellIdentifier: cellIdentifier.WordMeaningCell.rawValue, items: self.serachViewModel.wordData.meanings, configureCell: { (cell, meaning) in
            cell.partOfSpeechLabel.text = meaning.partOfSpeech
            cell.definationLabel.text = meaning.definitions[0].definition
        })
        
        DispatchQueue.main.async {
            self.wordDetailsTableview.dataSource = self.dataSource
            self.wordDetailsTableview.reloadData()
        }
    }

}

//MARK: - SearchViewController Extension
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        print(searchBar.text ?? "")
        serachViewModel.searchText = searchBar.text
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

extension SearchViewController: SearchViewModelProtocol {
    func showMessagetoViewController(with msg: String) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.activityIndicator.stopAnimating()
            Helper().showAlert(vc: self, title: "Error", message: msg)
        }
    }
}


