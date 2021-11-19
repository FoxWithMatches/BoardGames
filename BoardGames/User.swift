//
//  User.swift
//  BoardGames
//
//  Created by Илья Маркелов on 14.11.2021.
//

struct User {
    var name: String
    var phone: String
    
    static func getUserData() -> User {
        User(name: "", phone: "")
    }
}
