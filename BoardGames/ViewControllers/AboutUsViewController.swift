//
//  AboutUsViewController.swift
//  BoardGames
//
//  Created by Vlad Ryabtsev on 18.11.2021.
//

import UIKit

class AboutUsViewController: UIViewController {
    
    @IBOutlet var aboutUsOutlet: UILabel!
    @IBOutlet var photoOne: UIImageView!
    @IBOutlet var photoTwo: UIImageView!
    @IBOutlet var photoThree: UIImageView!
    @IBOutlet var photoFour: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutUsOutlet.text = """
            Спасибо, что выбрали
            нас!
            """
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        photoOne.layer.cornerRadius = photoOne.frame.width / 2
        photoTwo.layer.cornerRadius = photoTwo.frame.width / 2
        photoThree.layer.cornerRadius = photoThree.frame.width / 2
        photoFour.layer.cornerRadius = photoFour.frame.width / 2
        
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        
    }
}
