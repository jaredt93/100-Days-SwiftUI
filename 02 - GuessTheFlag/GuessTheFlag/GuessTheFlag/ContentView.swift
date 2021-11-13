//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jared Tamulynas on 10/26/21.
//

import SwiftUI

// View composition
struct FlagImage: View {
    var image: String

    var body: some View {
        Image(image)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var gameOver = false
    @State private var scoreMessage = ""
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var userScore = 0
    @State private var questionNumber = 0
    @State private var animationAmount = 1.0
    @State private var opacityAmount = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],  center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
        
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    .foregroundColor(.secondary)
                
                    ForEach(0..<3) { number in
                        Button {
                            withAnimation {
                                flagTapped(number)
                            }
                        } label: {
                            FlagImage(image: countries[number])
                                .rotation3DEffect(.degrees(number == correctAnswer ? animationAmount : 1.0), axis: (x: 0, y: 1, z: 0))
                                .opacity(number == correctAnswer ? 1.0 : opacityAmount)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score:   \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert("Game Over!", isPresented: $gameOver) {
            Button("Contine", action: newGame)
        } message: {
            Text("Final Score: \(userScore)")
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Contine", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            animationAmount += 360
            userScore += 1
            scoreTitle = "Correct!"
            scoreMessage = "Nice Job! Your score is \(userScore)."
        } else {
            userScore -= 1
            scoreTitle = "Wrong!"
            scoreMessage = "That is the flag of \(countries[number]). Your score is \(userScore)."
        }
        
        opacityAmount = 0.25
        questionNumber += 1
        
        if questionNumber >= 8 {
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        opacityAmount = 1.0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func newGame() {
        askQuestion()
        questionNumber = 0
        userScore = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
