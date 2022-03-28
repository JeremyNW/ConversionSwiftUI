//
//  ContentView.swift
//  HuddyTestOne
//
//  Created by Jeremy Warren on 3/26/22.
//

import SwiftUI

struct ContentView: View {
    @State var unitAmount = 0.0
    @State var startUnit = "Kilometers"
    @State var endUnit = "Miles"
    let units = ["Centimeters","Inches","Feet","Meters","Yards","Kilometers","Miles"]
    var endAmount: Double {
        var startAmount = unitAmount
        if startUnit == "Inches" {
            startAmount *= 2.54
        } else if startUnit == "Feet" {
            startAmount *= 30.48
        } else if startUnit == "Meters" {
            startAmount *= 100
        } else if startUnit == "Yards" {
            startAmount *= 91.44
        } else if startUnit == "Kilometers" {
            startAmount *= 100000
        } else if startUnit == "Miles" {
            startAmount *= 160934
        }
        if endUnit == "Inches" {
            startAmount /= 2.54
        } else if endUnit == "Feet" {
            startAmount /= 30.48
        } else if endUnit == "Meters" {
            startAmount /= 100
        } else if endUnit == "Yards" {
            startAmount /= 91.44
        } else if endUnit == "Kilometers" {
            startAmount /= 100000
        } else if endUnit == "Miles" {
            startAmount /= 160934
        }
        
        return startAmount
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $unitAmount, format: .number)
                    Picker("", selection: $startUnit) {
                        ForEach(units, id: \.self) {unit in
                            Text(unit)
                        }
                    }
                    
                } header: {
                    Text(startUnit)
                }
                
                Section {
                    Text(endAmount.formatted())
                    Picker("", selection: $endUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                } header: {
                    Text(endUnit)
                }
                
            }
            .navigationTitle("ConversionApp")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
