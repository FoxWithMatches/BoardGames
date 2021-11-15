//
//  DescriptionViewController.swift
//  BoardGames
//
//  Created by Vlad Ryabtsev on 15.11.2021.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var nameOfGameLabel: UILabel!
    @IBOutlet var imageOfGameLabel: UIImageView!
    @IBOutlet var descriptionLabel: UITextView!
    
    var game: BoardGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfGameLabel.text = game.name
        imageOfGameLabel.image = UIImage(named: game.name)
        descriptionLabel.text = game.description
    }
}
