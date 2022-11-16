//
//  ColorSlider.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value:Double;
    var color: Color;
    
    var body: some View {
        HStack{
            Image(systemName: "pencil.circle.fill")
            .foregroundColor(color)
            Slider(value: $value, in: 0...1, step: 0.05)
            .padding()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    @State static var value = 1.0
    @State static var color:Color = .red;
    
    static var previews: some View {
            ColorSlider(value: $value, color: color)
        
    }
}
