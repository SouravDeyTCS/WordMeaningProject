//
//  SearchViewController.swift
//  AcronymDetailsProject
//
//  Created by User on 13/07/23.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var acronymDetailsTableview: UITableView!
    @IBOutlet weak var acronymSearchBar: UISearchBar!
    private var serachViewModel: SearchViewModel!
    
    private var dataSource: WordTableViewDataSource<WordTableViewCell, Meaning>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acronymDetailsTableview.estimatedRowHeight = 40
        acronymDetailsTableview.rowHeight = UITableView.automaticDimension
        callToViewModelForUIUpdate()
        // Do any additional setup after loading the view.
    }
    
    func callToViewModelForUIUpdate() {
        self.serachViewModel = SearchViewModel()
        self.serachViewModel.bindSearchViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource() {
        self.dataSource = WordTableViewDataSource(cellIdentifier: cellIdentifier.WordMeaningCell.rawValue, items: self.serachViewModel.wordData.meanings, configureCell: { (cell, meaning) in
            cell.partOfSpeechLabel.text = meaning.partOfSpeech
            cell.definationLabel.text = meaning.definitions[0].definition
        })
        
        DispatchQueue.main.async {
            self.acronymDetailsTableview.dataSource = self.dataSource
            self.acronymDetailsTableview.reloadData()
        }
    }

}

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
    }
}


