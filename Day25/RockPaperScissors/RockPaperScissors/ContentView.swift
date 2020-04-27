//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Oscar da Silva on 26.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var choices = ["Papier", "Cailloux", "Ciseaux"]
    @State private var winLoose = ["Gagner", "Perdre"]
    @State private var iaChoice = Int.random(in: 0...2)
    @State private var userChoice = 0
    @State private var userWinOrLoose = 0
    @State private var step = 0
    @State private var userScore = 0
    @State private var iaScore = 0
    @State private var result = ""
    @State private var countOfGames = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    init() {
        print("Start game : \(choices[iaChoice])")
    }
    
    var body: some View {
        ZStack{
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack(spacing:30){
                VStack(spacing: 20){
                    Text("Tu veux gagner ou perdre ?")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                    HStack{
                        ForEach(0 ..< winLoose.count){number in
                            Button(action: {
                                self.winLooseTapped(number: number)
                            }){
                                Text(self.winLoose[number])
                            }
                            .foregroundColor(Color.white)
                        }
                    }
                }
                VStack(spacing: 20){
                    Text("Ton choix ?")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                    HStack{
                        ForEach(0 ..< choices.count){number in
                            Button(action: {
                                self.userChoiceTapped(number: number)
                            }){
                                Text(self.choices[number])
                            }
                            .foregroundColor(Color.white)
                        }
                    }
                }.opacity(step > 0 ? 1 : 0)
                VStack(spacing: 20){
                    Text("Choix de ton adversaire : \(choices[iaChoice])")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .hidden()
                    Text("Tu aurais du choisir de Perdre :)")
                        .font(.headline)
                        .foregroundColor(Color.white)
                        .hidden()
                    Text("Toi vs IA : \(userScore) - \(iaScore)")
                        .font(.title)
                        .foregroundColor(Color.white)
                }
            }
        }
        .alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Résultat final : Toi = \(userScore) IA = \(iaScore)"), dismissButton: .default(Text("Continuer")){
                self.reStart()
                })
        }
    }
    
    func winLooseTapped(number : Int){
        userWinOrLoose = number
        step = 1
    }
    
    func userChoiceTapped(number : Int){
        userChoice = number
        runAlgo()
    }
    
    func runAlgo(){
        if countOfGames < 6 {
            switch choices[iaChoice] {
            case "Papier":
                switch userChoice {
                case 0:
                    result = "égalité"
                    print("\(choices[iaChoice]) & \(choices[userChoice]) -> égalité")
                case 1:
                    if userWinOrLoose == 1 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                case 2:
                    if userWinOrLoose == 0 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                default:
                    print("Error")
                }
                step = 0
            case "Cailloux":
                switch userChoice {
                case 0:
                    if userWinOrLoose == 0 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                case 1:
                    result = "égalité"
                    print("\(choices[iaChoice]) & \(choices[userChoice]) -> égalité")
                case 2:
                    if userWinOrLoose == 1 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                default:
                    print("Error")
                }
            case "Ciseaux":
                switch userChoice {
                case 0:
                    if userWinOrLoose == 1 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                case 1:
                    if userWinOrLoose == 0 {
                        result = "Gagné"
                        userScore += 1
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> gagné")
                    }else{
                        result = "Perdu"
                        print("\(choices[iaChoice]) & \(choices[userChoice]) -> perdu")
                        iaScore += 1
                    }
                case 2:
                    result = "égalité"
                    print("\(choices[iaChoice]) & \(choices[userChoice]) -> égalité")
                default:
                    print("Error")
                }
            default:
                print("Error")
            }
        }

        reStart()
    }
    
    func reStart(){
        print(countOfGames)
        countOfGames += 1
        if countOfGames == 0 {
            iaScore = 0
            userScore = 0
        }
        if countOfGames < 6 {
            step = 0
            iaChoice = Int.random(in: 0...2)
            print("Restart -> \(choices[iaChoice])")
        }else{
            print("Fin de la partie")
            if userScore > iaScore {
                scoreTitle = "Bravo! Tu as gagné!"
            }else if userScore < iaScore {
                scoreTitle = "Dommage! Tu as perdu!"
            }else{
                scoreTitle = "Oh! Égalité!"
            }
            countOfGames = 0
            showingScore = true
            step = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
