//
//  WordTableViewCell.swift
//  WordDictionaryProject
//
//  Created by User on 17/07/23.
//

import UIKit

class WordTableViewCell: UITableViewCell {

//MARK: - Outlet Object Declaration
    @IBOutlet weak var partOfSpeechLabel: UILabel!
    @IBOutlet weak var definationLabel: UILabel!
    
//MARK: - Variables Declaration
    var wordMeaning: Meaning? {
        didSet {
            partOfSpeechLabel.text = wordMeaning?.partOfSpeech
            definationLabel.text = wordMeaning?.definitions[0].definition
        }
    }
    
//MARK: - Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
