//
//  RPSViewModel.swift
//  RPSGame
//
//  Created by fahreddin on 28.05.2022.
//

import Foundation
import SwiftUI

class RPSViewModel: ObservableObject {
    
    private let options: [RPS] = [.rock, .paper, .scissors]
    private var playerOption: RPS!
    
    @Published var playerScore: Int = 0
    @Published var opponentScore: Int = 0
    @Published var opponentOption: RPS? = nil
    
    var getOptions: [RPS] {
        return options
    }
    
    init() { }
    
    func setPlayerOption(_ option: RPS) {
        playerOption = option
    }
    
    func play() {
        let opponentOption: RPS = makeOpponentSelection()
        self.opponentOption = opponentOption
        
        switch opponentOption {
        case .rock:
            if playerOption == .paper {
                incrementPlayerScore()
            } else if playerOption == .scissors {
                incrementComputerScore()
            } else {
                // Draw
            }
        case .paper:
            if playerOption == .rock {
                incrementComputerScore()
            } else if playerOption == .scissors {
                incrementPlayerScore()
            } else {
                // Draww
            }
        case .scissors:
            if playerOption == .rock {
                incrementPlayerScore()
            } else if playerOption == .paper {
                incrementComputerScore()
            } else {
                // Draw
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.opponentOption = nil
        }
    }
    
}

extension RPSViewModel {
    
    func makeOpponentSelection() -> RPS {
        let randomNumber = Int(arc4random_uniform(3))
        return options[randomNumber]
    }
    
    func incrementPlayerScore() {
        playerScore += 10
    }
    
    func incrementComputerScore() {
        opponentScore += 10
    }
    
}
