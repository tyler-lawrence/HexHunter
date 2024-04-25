//
//  RGBSlidersView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/9/24.
//

import SwiftUI

struct RGBSlidersView: View {
    
    @Binding var hexcode: Hexcode
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var shared: some View {
        Group{
            HexComponentPickerView(component: $hexcode.red)
            HexComponentPickerView(component: $hexcode.green)
            HexComponentPickerView(component: $hexcode.blue)
        }
    }
    
    var body: some View {
        #if os(iOS)
        if dynamicTypeSize.isAccessibilitySize {
            ScrollView{
                shared
            }
        } else {
            VStack{
                shared
            }
        }
        #elseif os(macOS)
        HStack{shared}
        #endif
    }
}

#Preview {
    struct Preview: View {
        @State var vm = PracticeModeViewModel()
        var body: some View {
            RGBSlidersView(hexcode: $vm.playerHexcode)
        }
    }
    return Preview()
}
