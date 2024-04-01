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
    
    var v1Display: String {
        let lookupValue: Int = Int(component.v1)
        if let hexLabel: String = Hexcode.lookup[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var v2Display: String {
        let lookupValue: Int = Int(component.v2)
        if let hexLabel: String = Hexcode.lookup[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var pickers: some View {
        HStack{
            Picker("", selection: $component.v1){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val).tag(k)
                    }
                }
            }
            Picker("", selection: $component.v2){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val).tag(k)
                    }
                }
            }
        }
    }
    
    var sliders: some View {
        VStack{
            HStack{
                Text(v1Display)
                Slider(value: $component.v1, in: 0...15)
            }
            HStack {
                Text(v2Display)
                Slider(value: $component.v2, in: 0...15)
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
        HexComponentPickerView(component: .constant(Component(hexCategory: .red, v1: 0, v2: 0)))
    }
}
