//
//  ContentView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-30.
//

import SwiftUI
import UIKit

struct ContentView: View {
   
    @State var isAnimated: Bool = false;
    
    var body: some View {
       
            ZStack{
                Color("background").ignoresSafeArea()
//                Image("backg")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
                VStack(spacing:0.0){
                    VStack{
                        Text("MARCOS BORGES")
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(height: 100)
                        HStack{
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color( red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                                .scaleEffect(isAnimated ? 2 : 1)
                                .rotationEffect(Angle(degrees: isAnimated ? 90 : 0))
                                .padding(15)
                            
                            
                            Text("my iOS dev portfolio")
                                .fontWeight(.thin)
                                .foregroundColor(Color("Color1"))
                                .multilineTextAlignment(.trailing)
                                .frame(width: 180, height: 50)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color( red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                                .scaleEffect(isAnimated ? 2 : 1)
                                .rotationEffect(Angle(degrees: isAnimated ? 90 : 0))
                                .padding(15)
                            
                            
                        }.background(Color.black.opacity(0.3))
                            .cornerRadius(20)
//                            .frame(width: 400, height: 300)
                            .padding(5)
                    }.frame(height: 400)
                        
//                    Button("animate") {
//                        withAnimation(.default){
//                            isAnimated.toggle()
//                        }
//                    }.padding(10)
                    
                    Spacer()
                    
                    VStack{
                        if #available(iOS 16.0, *) {
                            List {
                                Section("Menu"){
                                    NavigationLink("Weather API", destination: WeatherView())
                                    NavigationLink("Color Picker Utility", destination: ColorPickerView())
                                    NavigationLink("About Me", destination: AboutMeView())
                                    NavigationLink("Contact", destination: ContactView())
                                    NavigationLink("Admin Page", destination: AdminView())
                                    NavigationLink("3D Model", destination: trimodel()).opacity(1)
                                }
                            }.listStyle(.insetGrouped)
                                .foregroundColor(Color.primary)
                                .scrollContentBackground(.hidden)
                        } else {
                            // Fallback on earlier versions
                            
                        }
                    }
                        
                         
                    
                }
                                
            }

    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
 
        ContentView()
    }
}
