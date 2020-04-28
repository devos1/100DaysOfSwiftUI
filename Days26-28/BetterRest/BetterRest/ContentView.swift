//
//  ContentView.swift
//  BetterRest
//
//  Created by Oscar da Silva on 27.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date()
    
//    // If youb want create date range
//    // when you create a new Date instance it will be set to the current date and time
//    let now = Date()
//
//    // create a second Date instance set to one day in seconds from now
//    let tomorrow = Date().addingTimeInterval(86400)
//
//    // create a range from those two
//    let range = now ... tomorrow
//
    
//    var components = DateComponents()
//    components.hour = 8
//    self.components.minute = 0
//    let date = Calendar.current.date(from: components) ?? Date()

//    let components = Calendar.current.dateComponents([.hour, .minute], from: Date()) // SomeDate normally
//    let hour = components.hour ?? 0
//    let minute = components.minute ?? 0

//    let formatter = DateFormatter()
//    formatter.timeStyle = .short
//    let dateString = formatter.string(from: Date())
//
    
    var body: some View {
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(sleepAmount, specifier: "%g") hours")
//        }
        
//        Form{
//            DatePicker("Please enter a date", selection: $wakeUp)
//        }
        
//        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
//        .labelsHidden()
        
        // Date range from now up to anything
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
