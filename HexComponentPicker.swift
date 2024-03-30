//
//  HexComponentPicker.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 3/30/24.
//

import SwiftUI

struct HexComponentPicker: View {
    @Binding var component: Component
    
    var pickers: some View {
        HStack{
            Picker("", selection: $component.v1){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val = Hexcode.lookup[k] {
                        Text(val)
                    }
                }
            }
            Picker("", selection: $component.v2){
                ForEach(Hexcode.sortedKeys, id: \.self){ k in
                    if let val = Hexcode.lookup[k] {
                        Text(val)
                    }
                }
            }
        }
    }
    
    var body: some View {
        #if os(macOS)
        pickers
        #else
        pickers
            .pickerStyle(.wheel)
        #endif
    }
}

#Preview {
    HexComponentPicker(component: .constant(Component(hexCategory: .red, v1: 0, v2: 0)))
}
