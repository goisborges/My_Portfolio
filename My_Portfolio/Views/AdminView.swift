//
//  AdminView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-09-02.
//

import SwiftUI

struct AdminView: View {
    @State var username = "";
    @State var password = "";
    
    func go() {
        
    }
    
    var body: some View {

        VStack{
            Text("Please log in to access data")
            Image(systemName: "lock.circle")
                .frame(width: 200, height: 200)
                .scaleEffect(6)
            HStack{
                Text("username")
                TextField("type your username", text: $username)
            }.padding()
            HStack{
                Text("password")
                TextField("type your password", text: $password)
                    
            }.padding()
      
        }.padding()
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
