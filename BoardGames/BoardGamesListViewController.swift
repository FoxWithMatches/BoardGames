//
//  BoardGamesListViewController.swift
//  BoardGames
//
//  Created by Илья Маркелов on 13.11.2021.
//

import UIKit

class BoardGamesListViewController: UITableViewController {
    
    var boardGamesList = BoardGame.getBoardGamesList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        boardGamesList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let boardGame = boardGamesList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = boardGame.name
        content.secondaryText = boardGame.price
        
        let itemSize = CGSize.init(width: 70, height: 70)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale)
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        content.image = UIImage(named: boardGame.name)
        content.image?.draw(in: imageRect)
        content.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        return cell
    }
    
// MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? DescriptionViewController else {return}
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let game = boardGamesList[indexPath.row]
        descriptionVC.game = game
    }
    
}
