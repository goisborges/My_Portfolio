//
//  FirstView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-11-03.
//

import SwiftUI
import SwiftUIFontIcon

struct FirstView: View {
    
    // declare variables
    @State var isLinkActive: Bool = false
    
    @State var isIconActive: Bool = false
    
    @State var presentSheet: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("background").ignoresSafeArea()
                
                VStack {
                    
                    Image("marcos_photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400, height: 400)
                        .clipShape(Circle())
                        .padding(50)
                        
                    Spacer()
                    
                    VStack{
                        Text("Marcos Borges")
                            .font(.system(size: 40, weight: .bold, design: .rounded))
                            .fontWeight(.semibold)
                            .padding(4)
                            
                        Text("Computer Programmer")
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .onTapGesture {
                                isLinkActive.toggle()
                            }
                        HStack {
                            Spacer()
                            NavigationLink("Let's Go", destination: ContentView()).foregroundColor(isLinkActive ? .black : Color.orange)
                                .padding(0)
                                .onTapGesture {
                                    withAnimation {
                                        isLinkActive.toggle()
                                    }
                                }
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .padding(5)
                                .foregroundColor(.orange)
                                .frame(width: 50, height: 50)
                        }.padding([.trailing], 20)
               
                    }.frame(width: UIScreen.main.bounds.width - 20, height: 160)
                        .background(Color.white.opacity(0.9).blur(radius: 5).shadow(color: .orange, radius: 4))
                        
                        .cornerRadius(30)
                        .padding(8)
                        .foregroundColor(Color.black)
                        
                        
                    
                    Spacer()
                    
                    HStack{
                        
                        Link(destination: URL(string: "https://www.github.com/goisborges/")!, label: {
                            FontIcon.text(.ionicon(code: .logo_github), fontsize: 40, color: .white)
                            
                        }).padding()
                        
                        Link(destination: URL(string: "https://www.linkedin.com/in/marcosdegoisborges/")!, label: {
                            FontIcon.text(.ionicon(code: .logo_linkedin), fontsize: 40, color: .white)
                            
                        }).padding()
                        
                        Link(destination: URL(string: "mailto:goisborges@gmail.com")!, label: {
                            FontIcon.text(.ionicon(code: .ios_mail), fontsize: 40, color: .white)
                               
                        }).padding()
                     
                        
//                        Link(destination: URL(string: "https://www.github.com/goisborges/")!, label: {
//                            Image("github_icon")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 30, height: 30)
//
//                        })
//
//                        Link(destination: URL(string: "https://www.linkedin.com/in/marcosdegoisborges/")!, label: {
//                            Image("linkedin")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 40, height: 40)
//                        })
//
//                        Link(destination: URL(string: "mailto:goisborges@gmail.com")!, label: {
//                                Image(systemName: "mail.fill")
//                                .resizable()
//                                .foregroundColor(.white).scaledToFit()
//
//                                .frame(width: 30, height: 30)
//                                .scaleEffect(x: isIconActive ? 2 : 1, y: isIconActive ? 2 : 1, anchor: .leading)
//                                .onTapGesture {
//                                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 300, damping: 15)){
//                                        isIconActive.toggle()
//                                        presentSheet.toggle()
//                                    }
//                                }
//                        })
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 50)
                    
                }
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

