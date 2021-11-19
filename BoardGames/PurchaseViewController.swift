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
    @IBOutlet var stackBottomConstraint: NSLayoutConstraint!
    
//TODO: - Gроверить передачу моделей и их данные
    
    private var user = User.getUserData()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTF.delegate = self
        nameTF.returnKeyType = .next
        
        phoneTF.delegate = self
        phoneTF.returnKeyType = .done
        
        phoneTF.isEnabled = true
        phoneTF.enablesReturnKeyAutomatically = true
        
        nameTF.text = String(user.name)
        phoneTF.text = String(user.phone)
        
        initialSetup()
    }
  
    private func initialSetup() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardFrame: NSValue =  notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            self.stackBottomConstraint.constant = keyboardHeight + 10
            self.view.layoutIfNeeded()
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        
        if let keyboarddFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboarddFrame.cgRectValue.height
            self.stackBottomConstraint.constant = keyboardHeight - 100
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gratitudeVC = segue.destination as? GratitudeViewController else { return }
        gratitudeVC.user = user
        
    }
    
//TODO: - проверить алерты -
    
    @IBAction func purchaseButton() {
        
    }
}

extension PurchaseViewController {
 
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.nameTF.text = ""
            self.phoneTF.text = ""
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension PurchaseViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        
        if textField == nameTF {
            user.name = newValue
        } else {
            user.phone = newValue
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTF {
            phoneTF.becomeFirstResponder()
        } else {
            purchaseButton()
            performSegue(withIdentifier: "gratitude", sender: nil)
        }
        return true
    }
}
