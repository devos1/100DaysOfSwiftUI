//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar da Silva on 21.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var msg = ""
    var countriesUsed: [String] = []
    
    @State private var animationAmount = 0.0
    @State private var animationOpacity = 1.0
    @State private var animationAmount2: CGFloat = 1
    
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(Color.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3){number in
                    Button(action: {
                        self.flagTapped(number, country : self.countries[number])
                        if number == self.correctAnswer{
                            withAnimation(){
                                self.animationAmount += 360
                            }
                            self.animationOpacity = 0.25
                        }else{
                            self.animationOpacity = 1
                            self.animationAmount2 = 2
                        }
                    }){
                        FlagImage(img: self.countries[number])
                        //                        Image(self.countries[number])
                        //                            .renderingMode(.original)
                        //                            .clipShape(Capsule())
                        //                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        //                            .shadow(color: .black, radius: 2)
                    }.rotation3DEffect(.degrees(number == self.correctAnswer ? self.animationAmount : 0), axis: (x: 0, y: 1, z: 0))
                        .opacity(number != self.correctAnswer ? self.animationOpacity : 1)
                        .blur(radius: (self.animationAmount2 - 1) * 3)
                }
                Text("Your score is \(score)")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(msg), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int, country: String) {
        if number == correctAnswer {
            score += 1
            msg = "Your score is \(score)"
            scoreTitle = "Correct"
        } else {
            if score > 0 {
                score -= 1
            }else{
                score = 0
            }
            msg = "Oh No, it's \(country)\n Your score is \(score)"
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        animationAmount2 = 1
        animationOpacity = 1.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    var img : String
    
    var body: some View{
        Image(img)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}
