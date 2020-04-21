//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar da Silva on 21.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var showingAlert = false
    
    var body: some View {
//        VStack(alignment: .leading, spacing: 20){
//            Text("Hello, World!")
//            Text("This is inside a stack")
//        }
        
//        HStack(spacing: 20) {
//            Text("Hello World")
        
//            Text("This is inside a stack")
//        }
        
//        VStack {
//            Text("First")
//            Text("Second")
//            Text("Third")
//            Spacer()
//        }
        
//        ZStack {
//            Text("Hello World")
//            Text("This is inside a stack")
//        }
        
//        ZStack {
//            Text("Your content")
//        }
//        .background(Color.red)
        
        // The same result below
        
//        ZStack {
//            Text("Your content")
//                .background(Color.red)
//        }
        
//        ZStack{
////            Color.red
////            Color.red.frame(width: 200, height: 200)
//            Color(red: 1, green: 0.8, blue: 0)
//            Text("Your content")
//        }
        
        // Here without blank space on the top (full screen)
//        ZStack {
//            Color.red.edgesIgnoringSafeArea(.all)
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//            RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
//            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//            Text("Your content")
//        }
        
//        Button("Tap me!") {
//            print("Button was tapped")
//        }
  
//        Button(action: {
//            print("Button was tapped")
//        }) {
//            Text("Tap me!")
//        }
        
//        Button(action: {
//            print("Edit button was tapped")
//        }) {
//            Image(systemName: "pencil")
//        }
        
//        Button(action: {
//            print("Edit button was tapped")
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: "pencil")
//                Text("Edit")
//            }
//        }
        
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
