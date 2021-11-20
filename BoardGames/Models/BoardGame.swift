//
//  Model.swift
//  BoardGames
//
//  Created by Илья Маркелов on 13.11.2021.
//

struct BoardGame {
    let name: String
    let description: String
    let price: String
}

extension BoardGame {
    static func getBoardGamesList() -> [BoardGame] {
        var boardGames: [BoardGame] = []
        
        let data = DataManager.shared
        
        for index in 0..<data.gameName.count {
            let boardGame = BoardGame(
                name: data.gameName[index],
                description: data.description[index],
                price: data.price[index]
            )
            boardGames.append(boardGame)
        }
        return boardGames
    }
}
