//
//  HexComponentPicker.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

extension Hexcode {
    static let lookup: [Double: String] = [
        0:"0",
        1:"1",
        2:"2",
        3:"3",
        4:"4",
        5:"5",
        6:"6",
        7:"7",
        8:"8",
        9:"9",
        10:"A",
        11:"B",
        12:"C",
        13:"D",
        14:"E",
        15:"F"
    ]
    static var sortedKeys: [Double] = Array(lookup.keys).sorted(by: <)
}

struct HexComponentPickerView: View {
    @Binding var component: Component
    
    var digit1: String {
        let lookupValue: Int = Int(component.digit1)
        if let hexLabel: String = Hexcode.lookup[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var digit2: String {
        let lookupValue: Int = Int(component.digit2)
        if let hexLabel: String = Hexcode.lookup[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var pickers: some View {
        HStack{
            Picker("", selection: $component.digit1){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val)
                    }
                }
            }
            Picker("", selection: $component.digit2){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val)
                    }
                }
            }
        }
    }
    
    var sliders: some View {
        VStack{
            HStack{
                Text(digit1)
                Slider(value: $component.digit1, in: 0...15)
            }
            HStack {
                Text(digit2)
                Slider(value: $component.digit2, in: 0...15)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Material.thickMaterial)
        )
    }
    
    var body: some View {
        #if os(macOS)
        sliders
        #else
        pickers
            .pickerStyle(.wheel)
        #endif
    }
}

#Preview {
    VStack{
        HexComponentPickerView(component: .constant(Component(hexCategory: .red, digit1: 0, digit2: 0)))
    }
}
