//
//  HexcodeExplanation.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct HexcodeExplanationView: View {
    @State var hexcode = Hexcode()
    var body: some View {
        VStack{
            Text("Hexcodes")
                .font(.largeTitle)
            ScrollView{
                VStack(alignment: .leading){
                    Text("A hexcode is a hexadeicmal representation of a color.")
                    VStack(alignment: .leading){
                        Text("The first two characters represent ") + Text("red ").foregroundStyle(.red).bold()
                        Text("The first two characters represent ") + Text("green ").foregroundStyle(.green).bold()
                        Text("The first two characters represent ") + Text("blue ").foregroundStyle(.blue).bold()
                    }
                    .padding(.vertical)
                    Text("The scale goes from 00 to FF. The letters are introduced when we would get to double digit numbers. 10 becomes A, 11 becomes B, 12 becomes C, etc. The first number is a large scale change and the second character is finer detail")
                        .padding(.bottom)
                    Text("To convert the hex to a number you first convert the digit to its corresponding numeric value (if necessary). Then, multiply the first digit by 16 and then add the second digit")
                }
            }
            .padding(.horizontal)
            Divider()
            Text("Manipulate the values below to observe the color change")
            HStack{
                Text("#\(hexcode.display)")
                    .font(.largeTitle)
                    .padding()
                   ColorSquareView(title: "", hexcode: hexcode, showingCode: false)
            }
            HStack{
                HexComponentPickerView(component: $hexcode.red)
                HexComponentPickerView(component: $hexcode.green)
                HexComponentPickerView(component: $hexcode.blue)
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    HexcodeExplanationView()
}
