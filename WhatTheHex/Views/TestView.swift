//
//  TestView.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/1/24.
//

import SwiftUI

struct TestView: View {
    @State var vm = GameViewModel()
    var body: some View {
        VStack{
            Text(vm.targetHexcode.display)
            Text("\(vm.targetHexcode.red.digit1)")
            Text("\(vm.targetHexcode.red.digit2)")
            Circle()
                .foregroundStyle(Color(vm.targetHexcode))
            
        }
    }
}

#Preview {
    TestView()
}
