//
//  WordTableViewCell.swift
//  AcronymDetailsProject
//
//  Created by User on 17/07/23.
//

import UIKit

class WordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var partOfSpeechLabel: UILabel!
    @IBOutlet weak var definationLabel: UILabel!
    
    var wordMeaning: Meaning? {
        didSet {
            partOfSpeechLabel.text = wordMeaning?.partOfSpeech
            definationLabel.text = wordMeaning?.definitions[0].definition
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
