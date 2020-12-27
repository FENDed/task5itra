//
//  CustomCollectionViewCell.swift
//  task5
//
//  Created by User on 27.12.20.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var gameLabel: UILabel!
    
    func fillInCell(gameName:String) {
        gameLabel.text = gameName
    }
}
