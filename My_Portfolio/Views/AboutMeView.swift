//
//  AboutMeView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .center, spacing: 10.0){
                    Image("marcos_photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                    HStack{
                        
                        VStack(alignment: .center, spacing: 6.0){
                            Text("Marcos de Gois Borges")
                                .font(.headline)
                                .foregroundColor(Color.blue)
                            Text("Computer Programmer")
                            Text("Barrie (ON), Canada")
                            Text("GPA: 90.62")
                                .foregroundColor(Color.red)
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                    Text("      Recently graduated from the Computer Programming program at Georgian College, in Canada, I am searching for an opportunity to create great things for iOS. I have been developing some personal projects to improve my skills. ")
                        .font(.body)
                    Text("      I have been working as a FullStack Developer for 1 year and 6 months now, which gave me great knowledge and experience in the field. Now I am looking forward to use my creativity and skills creating mobile apps.")
                        .font(.body)
                    
                }.padding()
            }.navigationTitle("About Me")
        }
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
