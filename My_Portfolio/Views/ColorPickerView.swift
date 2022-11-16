//
//  ColorPickerView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI



struct ColorPickerView: View {
    //source of truth. These data belongs to here and it's binded to the ColorSlider.swift
    @State var red: Double = 0.5;
    @State var green: Double = 0.5;
    @State var blue: Double = 0.5;
    
    var body: some View {
        VStack{
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(Color( red: red, green: green, blue: blue, opacity: 1))
                
        Image(systemName: "sun.max.fill")
            .foregroundColor(Color(red: red, green: green, blue: blue, opacity: 1))
        ColorSlider(value: $red, color: .red)
        ColorSlider(value: $green, color: .green)
        ColorSlider(value: $blue, color: .blue)
        }.padding()
            .navigationTitle("Color Picker Utility")
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
