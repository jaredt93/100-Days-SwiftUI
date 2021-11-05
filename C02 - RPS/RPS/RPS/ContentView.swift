//
//  ContentView.swift
//  RPS
//
//  Created by Jared Tamulynas on 10/29/21.
//

import SwiftUI

struct ContentView: View {
    private let moves = ["👊", "✋", "✌️"]
    @State private var appMove = Int.random(in: 0...2)
    @State private var playerMove = 0
    @State private var toWin = Bool.random()
    @State private var playerScore = 0
    @State private var gameCount = 0
    @State private var showingScore = false
    @State private var scoreMessage = ""
    @State private var scoreTitle = ""
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color.blue, location: 0.3),
                .init(color: Color.cyan, location: 0.3),
            ],  center: .top, startRadius: 150, endRadius: 300)
                .ignoresSafeArea()
            
            VStack {
                Text("Rock, Paper, Scissors")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                HStack {
                    VStack(alignment: .trailing, spacing: 10) {
                        Text("Score:")
                        
                        Text("App Move:")
                    }
                    .padding(5)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("\(playerScore)")
                        
                        Text("\(moves[appMove])")
                    }
                    .padding(5)
                }
                .font(.title3)
                .foregroundColor(.white)
                
                Spacer()
                
                VStack {
                    VStack {
                    Text("PLAY TO")
                        .font(.subheadline.weight(.heavy))
                    Text("\(toWin ? "Win" : "Lose")")
                        .font(.largeTitle.weight(.semibold))
                    }
                        
                    .foregroundColor(.secondary)
                    
                    ForEach(0..<3) { number in
                        Button {
                           playGame(number)
                        } label: {
                            Text("\(moves[number])")
                                .font(.system(size: 75))
                                .padding(15)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Contine", action: gameOver ? newGame : next)
        } message: {
            Text(scoreMessage)
        }
    }
    
    func playGame(_ number: Int) {
        if(toWin) {
            if number == appMove + 1 || number == appMove - 2 {
                playerScore += 1
                scoreTitle = "You Won!"
                scoreMessage = "Nice Job! Your score is \(playerScore)."
            } else {
                playerScore -= 1
                scoreTitle = "You Lost!"
                scoreMessage = "Try better next time."
            }
        } else {
            if number == appMove - 1 || number == appMove + 2 {
                playerScore += 1
                scoreTitle = "You Won!"
                scoreMessage = "Nice Job! Your score is \(playerScore)."
            } else {
                playerScore -= 1
                scoreTitle = "You Lost!"
                scoreMessage = "Try better next time."
            }
        }

        
        gameCount += 1
        
        if gameCount >= 3 {
           scoreMessage += " Game over!"
            gameOver = true
        }
        
        showingScore = true
    }
    
    func next() {
        toWin.toggle()
        appMove = Int.random(in: 0...2)
    }
    
    func newGame() {
        next()
        gameCount = 0
        playerScore = 0
        gameOver = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
