//
//  PersonTableViewCell.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import Foundation
import UIKit

class PersonTableViewCell: UITableViewCell {
        
    @IBOutlet weak var personFullName: UILabel!
    
    @IBOutlet weak var profession: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
