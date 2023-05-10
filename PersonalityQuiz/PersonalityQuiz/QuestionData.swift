//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by JIMENEZ, JANINE on 4/27/23.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: characterType
}

enum characterType: Character {
    case Scooby = "🐶", Velma = "🤓", Daphne = "💋", fred = "🤔", shaggy = "🥪"
    
    var definition: String {
        switch self {
        case .Scooby:
            return "You are incredibly loyal! You love to hangout with your friends and are down for a good time!"
        case .Velma:
            return "You're a smarty pants! You like puzzles and love the logical side of the world. While you may have some friends, you would prefer staying home reading a book over a night out in the city!"
        case .Daphne:
            return "You are a beauty! You are incredibly feminine and you may be a hopeless romantic! You take life as a good time and try not to get to serious about anything, but will be serious when you need to!"
        case .fred:
            return "You are the leader! You love to explore and create new things. You are the glue to a friend group and often are the party planner."
        case .shaggy:
            return "You are the chillest friend in your friend group! You must love snacks and know different placeds around town! You are here for the fun parts in life and you appreciate all of your friends and moments in life."
        }
    }
    
}
