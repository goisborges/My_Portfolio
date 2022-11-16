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

//    init() { UITableView.appearance().backgroundColor = UIColor.clear}
    
    var body: some View {
       
            ZStack{
                VStack(spacing:0.0){
            
                    Text("Marcos de Gois Borges")
                        .font(.largeTitle)
                        .foregroundColor(Color("Color2"))
                        .padding()
                        .frame(height: 100)
                    HStack{

                        Image(systemName: "star.fill")
                            .foregroundColor(Color( red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                            .scaleEffect(isAnimated ? 2 : 1)
                            .padding(15)
                            
                        
                        Text("my iOS dev portfolio")
                            .fontWeight(.thin)
                            .foregroundColor(Color("Color1"))
                            .multilineTextAlignment(.trailing)
                            .frame(width: 180, height: 50)
                            
                        Image(systemName: "star.fill")
                            .foregroundColor(Color( red: 255/255, green: 255/255, blue: 255/255, opacity: 1))
                            .scaleEffect(isAnimated ? 2 : 1)
                            .padding(15)
                        
                            
                    }.background(Color.white.opacity(0.3))
                        .cornerRadius(20)
                        .frame(width: 400, height: 100)
                        
                    Button("animate") {
                        withAnimation(.default){
                            isAnimated.toggle()
                        }
                    }
                    
                    Spacer()
                    
                    List {
                        Section("Menu"){
                            NavigationLink("Weather API", destination: WeatherView())
                            NavigationLink("Color Picker Utility", destination: ColorPickerView())
                            NavigationLink("About Me", destination: AboutMeView())
                            NavigationLink("Contact", destination: ContactView())
                            NavigationLink("Admin Page", destination: AdminView())
                            NavigationLink("3D Model", destination: trimodel())
                        }
                    }.listStyle(InsetGroupedListStyle())
                        .frame(height: 400)
                    
                }
                
            }.background{
                LinearGradient(gradient: Gradient(colors: [Color("Color3"), Color("Color4")]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                
            }
        
            
        
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
 
        ContentView()
    }
}
