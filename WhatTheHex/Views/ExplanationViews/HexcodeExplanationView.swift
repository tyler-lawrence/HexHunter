//
//  HexcodeExplanation.swift
//  WhatTheHex
//
//  Created by Tyler Lawrence1 on 4/2/24.
//

import SwiftUI

struct HexcodeExplanationView: View {
    let hexcode = Hexcode.teal
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(introMessage)
                    VStack(alignment: .leading) {
                        Text("The first two characters represent ") + Text("red ").foregroundStyle(.red).bold()
                        Text("The second two characters represent ") + Text("green ").foregroundStyle(.green).bold()
                        Text("The third two characters represent ") + Text("blue ").foregroundStyle(.blue).bold()
                        Text(introAlphaMessage)
                    }
                    .padding(.vertical)
                    Text(scaleMessage)
                        .padding(.bottom)
                    Text(conversionIntroMessage)
                    Text("(Character1 * 16) + Character2").bold()
                    Divider()
                    Text("Example")
                        .font(.headline)
                    Text("Let's take a look at the color ") +
                    Text("#\(hexcode.display). ")
                        .bold().foregroundStyle(Color(hexcode)) +
                    Text("Following the formula from above we get")
                    Text("Red = (2 * 16) + 0 = 32")
                    Text("Green = (10 * 16) + 0 = 160")
                    Text("Blue = (11 * 16) + 0 = 176")
                }
            }
            .padding(.horizontal)
        }
    }
    // MARK: Strings
    var introMessage: String {
    """
    A hexcode is a hexadecimal representation of a color. \
    You may have seen a color picking tool request a number from 0 to 255. \
    Let's explore how we can convert something like #\(hexcode.display) \
    to the 0-255 scale.
    """
    }
    let introAlphaMessage: String =
    """
    Sometimes you also see alpha attached to a hexcode.\
     Alpha represents the opacity of a color.
    """
    let scaleMessage =
    """
    The scale goes from 00 to FF. \
    The letters are introduced when we would get to double digit numbers. \
    10 becomes A, 11 becomes B, 12 becomes C, etc. \
    The first number is a large scale change and the second character is \
    finer detail
    """
    let conversionIntroMessage =
    """
    To convert the hexcode to a number you first convert the digit \
    to its corresponding numeric value (if necessary) and apply the \
    following formula:
    """
}

#Preview {
    HexcodeExplanationView()
}
