//
//  GratitudeViewController.swift
//  BoardGames
//
//  Created by Alisa Ts on 18.11.2021.
//

import UIKit

class GratitudeViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "\(user.name), ждем Вас снова!"
        //внести картинку в модель
        imageView.image = UIImage(named: image.Image)
    }
}
