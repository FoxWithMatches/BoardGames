//
//  DescriptionViewController.swift
//  BoardGames
//
//  Created by Vlad Ryabtsev on 15.11.2021.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var imageOfGameLabel: UIImageView!
    @IBOutlet var descriptionLabel: UITextView!
    @IBOutlet var priceLabel: UILabel!
    
    var game: BoardGame!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = game.name
        imageOfGameLabel.image = UIImage(named: game.name)
        descriptionLabel.text = game.description
        priceLabel.text = "Цена: \(game.price)"
    }
    
    // MARK: - Navigation
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let purchaseVC = segue.destination as? PurchaseViewController else {return}
            purchaseVC.game = game
        }
        
    }
    
    
    

