//
//  ContentView.swift
//  UserDefaults
//
//  Created by Oscar da Silva on 09.05.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "TapCount")
    
    var body: some View {
        Button("Tap Count \(tapCount)"){
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "TapCount")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
