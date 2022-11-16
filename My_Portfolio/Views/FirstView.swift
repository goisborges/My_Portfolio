//
//  FirstView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-11-03.
//

import SwiftUI

struct FirstView: View {
    

    @State var isLinkActive: Bool = false
    
    @State var isIconActive: Bool = false
    
    @State var presentSheet: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("Color2").ignoresSafeArea()
                VStack {
                    
                    Image("marcos_photo_copy")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .padding(50)
                        
                    VStack{
                        
                        Text("Marcos de Gois Borges")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            
                        Text("check my portfolio")
                            .font(.subheadline)
                            .onTapGesture {
                                isLinkActive.toggle()
                            }
                        HStack {
                            Spacer()
                            NavigationLink("Let's Go", destination: ContentView()).foregroundColor(isLinkActive ? .black : Color("Color3"))
                                .padding(0)
                                .onTapGesture {
                                    withAnimation {
                                        isLinkActive.toggle()
                                    }
                                }
                            Image(systemName: "arrow.right.circle.fill").padding(5)
                        }
               
                    }.frame(width: UIScreen.main.bounds.width, height: 300)
                        .background(Color.white)
                        .padding(5)
                    Spacer()
                    HStack{
//                        Spacer()

                        Link(destination: URL(string: "https://www.github.com/goisborges/")!, label: {
                            Image("github_icon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                        })
                        
                        
                        Link(destination: URL(string: "https://www.linkedin.com/in/marcosdegoisborges/")!, label: {
                            Image("linkedin")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                        })
                        

                        
                        Link(destination: URL(string: "mailto:goisborges@gmail.com")!, label: {
                                Image(systemName: "mail.fill")
                                .resizable()
                                .foregroundColor(.black).scaledToFit()
                        
                                .frame(width: 30, height: 30)
                                .scaleEffect(x: isIconActive ? 2 : 1, y: isIconActive ? 2 : 1, anchor: .leading)
                                .onTapGesture {
                                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 300, damping: 15)){
                                        isIconActive.toggle()
                                        presentSheet.toggle()
                                    }
                                }
                            
                        })
                    }
                    
                        
                    
                }.foregroundColor(Color("Color3"))
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}


struct ContactSheet: View {
    var body: some View {
        Text("Bottom sheet")
    }
}

