//
//  ContentView.swift
//  WeSplit
//
//  Created by Oscar da Silva on 17.04.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        var amountPerPerson : Double = orderAmount
        if peopleCount > 0 {
            amountPerPerson = Double(grandTotal / peopleCount)
        }
        
        return amountPerPerson
    }
    
    var grandTotal: Double{
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        
        return grandTotal
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount : ",  text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of People : ", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                
//                    Picker("Number of People", selection: $numberOfPeopple){
//                        ForEach(2..<100){
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header: Text("How much tip do you want to leave ?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount per Person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Total Amount")){
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(Double(tipPercentages[tipPercentage]) == 0 ? .red : .black)
                }
                .navigationBarTitle("WeSplit")  
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
