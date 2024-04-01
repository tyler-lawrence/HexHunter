//
//  HexComponentPicker.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

struct HexComponentPicker: View {
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
    
    #if os(iOS)
    var pickers: some View {
        HStack{
            Picker("", selection: $component.v1){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val).tag(k)
                    }
                }
            }
            .pickerStyle(.wheel)
            Picker("", selection: $component.v2){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val: String = Hexcode.lookup[k] {
                        Text(val).tag(k)
                    }
                }
            }
            .pickerStyle(.wheel)
        }
    }
    #endif
    
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
//            .pickerStyle(.wheel)
        #endif
    }
}

#Preview {
    VStack{
        HexComponentPicker(component: .constant(Component(hexCategory: .red, v1: 0, v2: 0)))
    }
}
