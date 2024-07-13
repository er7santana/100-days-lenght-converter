//
//  ContentView.swift
//  LenghtConverter
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 13/07/24.
//

import SwiftUI

enum LenghtUnits {
    case kilometers
    case miles
    
    var title: String {
        switch self {
        case .kilometers:
            return "Kilometers"
        case .miles:
            return "Miles"
        }
    }
}

struct ContentView: View {
    
    @State private var inputUnit = LenghtUnits.kilometers.title
    @State private var outputUnit = LenghtUnits.miles.title
    @State private var inputValue = 1.0
    
    let units = [
        LenghtUnits.kilometers,
        .miles
    ]
    
    var resultValue: Double {
        guard inputUnit != outputUnit else {
            return inputValue
        }
        
        if outputUnit == LenghtUnits.miles.title {
            return inputValue / 1.6
        }
        
        return inputValue * 1.6
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Input value") {
                    TextField("Input value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                    
                }
                
                Section("Input unit") {
                    Picker("Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self.title) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output unit") {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self.title) {
                            Text($0.title)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Result") {
                    Text(resultValue.formatted()) +
                    Text(" \(outputUnit)")
                }
            }
            .navigationTitle("Lenght Converter")
        }
    }
}

#Preview {
    ContentView()
}
