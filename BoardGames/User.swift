//
//  User.swift
//  BoardGames
//
//  Created by Илья Маркелов on 14.11.2021.
//

struct User {
    let name: String
    let phone: String
}

extension User {
    static func getUserData() -> User {
        let data = DataManager.shared

       return  User(name: data.userName,
             phone: data.phone)
    }
}
