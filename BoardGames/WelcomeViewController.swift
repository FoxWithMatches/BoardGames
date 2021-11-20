//
//  WelcomeViewController.swift
//  BoardGames
//
//  Created by Александр Матукин on 19.11.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeImage: UIImageView!
    @IBOutlet var welcomeLabel: UILabel!
    
    public let welcome = WelcomeScreen.getWelcome()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = welcome.text
        welcomeImage.image = UIImage(named: welcome.image)
    }
    
}
