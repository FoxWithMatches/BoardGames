//
//  PurchaseViewController.swift
//  BoardGames
//
//  Created by Павел Цыганов on 14.11.2021.
//

import UIKit

// добавить unwind
// инициализировать game экземпляр модели
// передать с предыдущего экрана картинку, название, цену

class PurchaseViewController: UIViewController {

    @IBOutlet var imageOfGame: UIImageView!
    @IBOutlet var nameGame: UILabel!
    @IBOutlet var priceGame: UILabel!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    
//    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageOfGame.image = UIImage(named: game.title)
//        nameGame.text = game.title
//        priceGame.text = "Цена: \(game.price)"
        
        nameTF.delegate = self
        nameTF.returnKeyType = .next
        
        phoneTF.delegate = self
        phoneTF.returnKeyType = .done
        
        phoneTF.isEnabled = true
        phoneTF.enablesReturnKeyAutomatically = true
        
    }
    
    @IBAction func purchaseButton() {
        let name = "User"
        let phone = "12345"
        
        guard nameTF.text == name else {
            showAlert(title: "Неверное имя", message: "Используйте 'User'")
            return
        }
        guard phoneTF.text == phone else {
            showAlert(title: "Неверный номер телефона", message: "Используйте 12345")
            return
        }
    }
//    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
//
//    } перенести на экран TableView
}


extension PurchaseViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.nameTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension PurchaseViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            phoneTF.becomeFirstResponder()
        } else {
            purchaseButton()
            performSegue(withIdentifier: "purchase", sender: nil)
        }
        return true
    }
}
