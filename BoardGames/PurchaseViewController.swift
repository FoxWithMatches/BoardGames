//
//  PurchaseViewController.swift
//  BoardGames
//
//  Created by Alisa Ts on 14.11.2021.
//

import UIKit

class PurchaseViewController: UIViewController {

    @IBOutlet var imageOfGame: UIImageView!
    @IBOutlet var nameGame: UILabel!
    @IBOutlet var priceGame: UILabel!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var phoneTF: UITextField!
    
    //TODO: - Gроверить передачу моделей и их данные
    
//    var game: BoardGame!
//    ptivate let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        imageOfGame.image = UIImage(named: game.name)
//        nameGame.text = game.name
//        priceGame.text = "Цена: \(game.price)"
        
        nameTF.delegate = self
        nameTF.returnKeyType = .next
        
        phoneTF.delegate = self
        phoneTF.returnKeyType = .done
        
        phoneTF.isEnabled = true
        phoneTF.enablesReturnKeyAutomatically = true
    }
  
//TODO: - проверить алерты -
    
    @IBAction func purchaseButton() {
//        guard nameTF.text == user.name else {
//            showAlert(title: "Неверное имя", message: "Используйте 'User'")
//            return
//        }
//        guard phoneTF.text == user.phone else {
//            showAlert(title: "Неверный номер телефона", message: "Используйте 12345")
//            return
//        }
    }
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
