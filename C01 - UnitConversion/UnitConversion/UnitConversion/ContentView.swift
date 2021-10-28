//
//  ContentView.swift
//  UnitConversion
//
//  Created by Jared Tamulynas on 10/25/21.
//

import SwiftUI

struct ContentView: View {
    @State private var conversionType = 0
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    @State private var inputNumber = ""
    
    enum conversionTypes {
        case temperature
        case length
        case time
        case volume
    }
    
    let conversionTypes = ["Temp", "Length", "Time", "Volume"]
    
    var units: [String] {
        let units: [String]
        let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
        let lengthUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
        let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
        let volumeUnits = ["Milliliters", "Liters", "Cups", "Pints", "Gallons"]
        
        switch conversionType {
        case 0:
            units = temperatureUnits
        case 1:
            units = lengthUnits
        case 2:
            units = timeUnits
        case 3:
            units = volumeUnits
        default:
            units = temperatureUnits
        }
        
        return units
    }
    
    var result: Measurement<UnitLength> {
        let unitLengths = [UnitLength.meters, UnitLength.kilometers, UnitLength.feet, UnitLength.yards, UnitLength.miles]
        let inputLength = Measurement(value: Double(inputNumber) ?? 0, unit: unitLengths[inputUnit])
        let outputLength = inputLength.converted(to: unitLengths[outputUnit])
        
        return outputLength
    }
    
    var body: some View {
        let binding = Binding(
                    get: { conversionType },
                    set: {
                        conversionType = $0
                        inputUnit = 0
                        outputUnit = 0
                    })
        
        return NavigationView {
            Form {
                Section(header: Text("Select Conversion Type")) {
                    Picker("Select Conversion Type", selection: binding) {
                        ForEach(0 ..< self.conversionTypes.count) {
                            Text("\(self.conversionTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    
                Section(header: Text("Select Input Unit")) {
                    Picker("Select Input Unit", selection: $inputUnit) {
                        ForEach(units.indices, id:\.self) {
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                    
                Section(header: Text("Select Output Unit")) {
                    Picker("Select Output Unit", selection: $outputUnit) {
                        ForEach(units.indices, id:\.self) {
                            Text("\(units[$0])")
                           }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                       
                }
                    
                Section(header: Text("Enter Number To Convert")) {
                    TextField("Number (\(units[inputUnit]))", text: $inputNumber)
                        .keyboardType(.decimalPad)
                            
                }
                    
                Section(header: Text("Result")) {
                    Text("\(result.value, specifier: "%.2f") (\(units[outputUnit]))")
                }
            }
            .navigationBarTitle("Unit Conversion")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
