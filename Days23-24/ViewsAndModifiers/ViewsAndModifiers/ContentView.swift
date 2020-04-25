//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Oscar da Silva on 24.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {

        Text("Test Toto...")
            .largeBlue()

//        Text("Hello Toto")
//            .titleStyle()

//        Text("Hello World")
//        .modifier(Title())

        // Avoir to copy the same things
//        VStack(spacing: 10) {
//            CapsuleText(text: "First")
//            CapsuleText(text: "Second")
//                .foregroundColor(.yellow)
//        }

//
//      VStack(spacing: 10) {
//          Text("First")
//              .font(.largeTitle)
//              .padding()
//              .foregroundColor(.white)
//              .background(Color.blue)
//              .clipShape(Capsule())
//
//          Text("Second")
//              .font(.largeTitle)
//              .padding()
//              .foregroundColor(.white)
//              .background(Color.blue)
//              .clipShape(Capsule())
//      }

//        VStack{
//            motto1
//                .foregroundColor(Color.red)
//            motto2
//                .foregroundColor(Color.blue)
//        }

        // In this case the inner modifier doesn't replace but add to VStack
//        VStack {
//            Text("Gryffindor")
//                .blur(radius: 0)
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .blur(radius: 5)

//        VStack {
//            Text("Gryffindor")
//                .font(.largeTitle)  // Overrides parent modifier
//            Text("Hufflepuff")
//            Text("Ravenclaw")
//            Text("Slytherin")
//        }
//        .font(.title)

//        Button("Hello World") {
//            // flip the Boolean between true and false
//            self.useRedText.toggle()
//        }
//        .foregroundColor(useRedText ? .red : .blue)

//        Text("Hello World")
//        .padding()
//        .background(Color.red)
//        .padding()
//        .background(Color.blue)
//        .padding()
//        .background(Color.green)
//        .padding()
//        .background(Color.yellow)

//        Button("Hello World") {
//            print(type(of: self.body))
//        }
//        .frame(width: 200, height: 200)
//        .background(Color.red)

//        Text("Hello, World!")
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.red)
//            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
//            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

struct LargeBlue : ViewModifier{
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.blue)
    }
    
    
}

extension View{
    func largeBlue() -> some View {
        self.modifier(LargeBlue())
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }

}
