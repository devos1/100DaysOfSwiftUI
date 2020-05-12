//
//  ContentView.swift
//  iExpense
//
//  Created by Oscar da Silva on 06.05.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(expenses.items) {item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                      Text("$\(item.amount)")
                        .modifier(ConditionalModifier(amount: item.amount))
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddExpense = true
                }){
                    Image(systemName: "plus")
            })
        }
        .navigationBarTitle("iExpense")
        .sheet(isPresented: $showingAddExpense) {
            AddView(expenses: self.expenses)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
 Example from : https://stackoverflow.com/questions/57467353/conditional-property-in-swiftui
 */
struct ConditionalModifier: ViewModifier{
    var amount: Int
    
    func body(content: Content) -> some View {
        Group{
            if amount < 10 {
                content.foregroundColor(.red)
            }else if amount < 100 {
                content.foregroundColor(.orange)
            }else{
                content.foregroundColor(.green)
            }
        }
    }
}
