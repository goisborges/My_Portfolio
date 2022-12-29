//
//  ContactView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-31.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack {
            Image(systemName: "mail").font(.system(size: 80)).padding(20)
            Text("E-mail me @").font(.headline)
            Text("goisborges@gmail.com").font(.title).padding(15)
        }
        
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
