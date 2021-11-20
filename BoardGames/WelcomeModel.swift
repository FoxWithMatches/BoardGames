//
//  File.swift
//  BoardGames
//
//  Created by Александр Матукин on 19.11.2021.
//

struct WelcomeScreen {
    let text: String
    let image: String
    
    static func getWelcome() -> WelcomeScreen {
        WelcomeScreen(
            text: """
            Настольные игры это отличный способ времяпровождения, разнообразия досуга и развлечения.  Каждая из подобных игр дарит не только яркие впечатления, азарт, но и межличностную коммуникацию, глубинная польза которой неоценима для каждого человека.  У нас вы найдете игру на любой вкус и возраст!
            """,
            image: "Welcome"
        )
    }
}
