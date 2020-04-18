//
//  ContentView.swift
//  WeSplit
//
//  Created by Oscar da Silva on 17.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack{
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
        
        
    
//        ForEach(0..<100){ number in
//            Text("Row \(number)")
//        }
        
        /*
         OR
         ForEach(0 ..< 100) {
             Text("Row \($0)")
         }
         */
        
        
        
//        Button("Tap Count: \(tapCount)"){
//            self.tapCount += 1
//          }
        
//        Form{
//            TextField("Enter your Name", text: $name) // $ means 2-way binding
//            Text("Your Name is \(name)")
//        }
        
//        NavigationView{
//            Form{
//                Section{
//                    Text("Hello World")
//                }
//            }
//            .navigationBarTitle("SwiftUI", displayMode: .inline)
//        }
        
//        Form{
//            Section{
//                Text("Hello, World!")
//                Text("Hello, World!")
//            }
//            Section{
//                Text("Hello, World!")
//                Text("Hello, World!")
//                Text("Hello, World!")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
