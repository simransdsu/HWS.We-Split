//
//  ContentView.swift
//  We Split
//
//  Created by Simran Preet Singh Narang on 2022-05-30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 15
    
    let tipPercentages = [0, 10, 12, 15, 18, 20, 25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount",
                              value: $checkAmount,
                              format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) { number in
                            Text("\(number) people")
                        }
                    }
                }
                
                Section("Tip percentage") {
                    Picker("Select tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) { percentage in
                            Text("\(percentage)%")
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    Text(checkAmount,
                         format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
            }.navigationTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
