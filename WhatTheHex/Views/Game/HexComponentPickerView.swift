//
//  HexComponentPicker.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

struct HexComponentPickerView: View {
    @Binding var component: Component
    
    var digit1: String {
        let lookupValue: Int = Int(component.digit1)
        if let hexLabel: String = Hexcode.labelMap[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var digit2: String {
        let lookupValue: Int = Int(component.digit2)
        if let hexLabel: String = Hexcode.labelMap[Double(lookupValue)] {
            return hexLabel
        }
        return ""
    }
    
    var pickers: some View {
        VStack {
            HStack{
                Picker("", selection: $component.digit1){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.labelMap[k] {
                            Text(val)
                        }
                    }
                }
                Picker("", selection: $component.digit2){
                    ForEach(Hexcode.sortedKeys, id: \.self){ k in
                        if let val: String = Hexcode.labelMap[k] {
                            Text(val)
                        }
                    }
                }
            }
            Text(component.hexCategory.rawValue)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundStyle(Material.thickMaterial)
        )
    }
    
    var sliders: some View {
        VStack{
            HStack{
                Text(component.display)
                    .font(.largeTitle)
            }
            HStack{
                Text(digit1)
                Slider(value: $component.digit1, in: 0...15)
            }
            HStack {
                Text(digit2)
                Slider(value: $component.digit2, in: 0...15)
            }
            Text(component.hexCategory.rawValue)
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

struct HexComponentPickerView_Previews: PreviewProvider {
    static var previews: some View {
        HexComponentPickerView(component: .constant(Component(hexCategory: .red, digit1: 0, digit2: 0)))
            .previewDevice("iPhone 15")
        HexComponentPickerView(component: .constant(Component(hexCategory: .red, digit1: 0, digit2: 0)))
            .previewDevice("My Mac")
    }
}
