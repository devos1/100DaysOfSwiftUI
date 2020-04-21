//
//  ContentView.swift
//  Day19_Converter
//
//  Created by Oscar da Silva on 20.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var userInput = ""
    @State private var inputUnitChoosed = 0
    @State private var outputUnitChoosed = 0
    
    let units = ["°C", "°F", "K"]
    
    var outputValue :Double{
        let input = Double(userInput) ?? 0
        
        switch inputUnitChoosed {
        case 0:
            if outputUnitChoosed == 0 {
                return input
            }else if(outputUnitChoosed == 1){
                return input * (9/5) + 32
            }else{
                return input + 273.15
            }
        case 1:
            if outputUnitChoosed == 0 {
                return (input - 32) * 5/9
            }else if(outputUnitChoosed == 1){
                return input
            }else{
                return (input - 32) * 5/9 + 273.15
            }
        case 2 :
            if outputUnitChoosed == 0 {
                return input - 273.15
            }else if(outputUnitChoosed == 1){
                return (input - 273.15) * 5/9 + 32
            }else{
                return input
            }
        default:
            return 1
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Choose input unit")){
                    Picker("Input Unit", selection: $inputUnitChoosed){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("Input Value", text: $userInput)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Choose output unit")){
                    Picker("Output Unit", selection: $outputUnitChoosed){
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(outputValue, specifier: "%.2f") \(units[outputUnitChoosed])")
                }
            }.navigationBarTitle("Day 19 - Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
