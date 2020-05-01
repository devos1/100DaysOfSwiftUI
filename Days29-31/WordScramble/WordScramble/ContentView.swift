//
//  ContentView.swift
//  WordScramble
//
//  Created by Oscar da Silva on 01.05.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
//        List {
//            Section(header: Text("Section 1")) {
//                Text("Static row 1")
//                Text("Static row 2")
//            }
//
//            Section(header: Text("Section 2")) {
//                ForEach(0..<5) {
//                    Text("Dynamic row \($0)")
//                }
//            }
//
//            Section(header: Text("Section 3")) {
//                Text("Static row 3")
//                Text("Static row 4")
//            }
//        }
//        //.listStyle(GroupedListStyle()) //Another UI option
        
        List(people, id: \.self) {
            Text($0)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
