//
//  ContentView.swift
//  RPSGame
//
//  Created by fahreddin on 28.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = RPSViewModel()
    
    var body: some View {
        ZStack {
            Color("background")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("rock-paper-scissors-icon")
                    .resizable()
                    .frame(width: 200, height: 150)
                
                Spacer()
                
                VStack {
                    Text("Computer:")
                    
                    Image(viewModel.opponentOption == nil ? "question-mark" :
                            viewModel.opponentOption!.rawValue)
                }
                
                Spacer()
                
                VStack {
                    Text("Player:")
                    
                    HStack {
                        ForEach(viewModel.getOptions, id: \.self) { option in
                            Button {
                                viewModel.setPlayerOption(option)
                            } label: {
                                Image(option.rawValue)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button("Play") {
                    viewModel.play()
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player Score:")
                        Text("\(viewModel.playerScore)")
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Computer Score:")
                        Text("\(viewModel.opponentScore)")
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
