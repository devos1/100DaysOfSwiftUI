//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Oscar da Silva on 09.05.20.
//  Copyright © 2020 Oscar da Silva. All rights reserved.
//

import Foundation

struct ExpenseItem : Identifiable, Codable {
    let id : UUID
    let name : String
    let type : String
    let amount : Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        // Doesn't work
        didSet{
            print("Entré dans didSet")
            let encoder = JSONEncoder()
            var encoded = Data()
            do{
                try encoded = encoder.encode(items)
            }catch{
                print("errir")
            }
//            if let encoded = try? encoder.encode(items){
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
            print(encoded)
            UserDefaults.standard.set(encoded, forKey: "Items")
            print(UserDefaults.standard.data(forKey: "Items"))
        }
    }
    
    init() {
        let items = UserDefaults.standard.data(forKey: "Items")!
        var dec = JSONDecoder()
        var dec1 = try! dec.decode([ExpenseItem].self, from: items)
        
        self.items = dec1
        print("1 : \(self.items)")
        print("2 : \(dec1)")
//        print("Ouverture : \(items)")
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }

        self.items = []
    }
}
