//
//  BoardGamesListViewController.swift
//  BoardGames
//
//  Created by Илья Маркелов on 13.11.2021.
//

import UIKit

class BoardGamesListViewController: UITableViewController {
    
    //MARK: - Public properties
    var boardGamesList = BoardGame.getBoardGamesList()
    var filteredBoardGamesList = BoardGame.getBoardGamesList()

    //MARK: - Private properties
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Найти настолку"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredBoardGamesList.count
        }
        return boardGamesList.isEmpty ? 0 : boardGamesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boardGameCell", for: indexPath)
        
        let boardGame: BoardGame
        
        if isFiltering {
            boardGame = filteredBoardGamesList[indexPath.row]
        } else {
            boardGame = boardGamesList[indexPath.row]
        }
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
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let boardGame: BoardGame
        
        if isFiltering {
            boardGame = filteredBoardGamesList[indexPath.row]
        } else {
            boardGame = boardGamesList[indexPath.row]
        }
        performSegue(withIdentifier: "description", sender: boardGame)
    }
    
//    //MARK: - Navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let descriptionVC = segue.destination as? DescriptionViewController else {return}
//        guard let indexPath = tableView.indexPathForSelectedRow else {return}
//
//        //Реализовать логику перехода после мерджа
//    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
       
    }
}

//MARK: - UISearchResultsUpdating
extension BoardGamesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchBar(textDidChange: searchController.searchBar.text!)
    }
    
    private func searchBar(textDidChange searchText: String) {
        filteredBoardGamesList = boardGamesList

        if searchText.isEmpty == false {
            filteredBoardGamesList = boardGamesList.filter({ $0.name.contains(searchText) })
        }
        tableView.reloadData()
    }
}
