//
//  3Dmodel.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-10-12.
//

import SwiftUI
import SceneKit

struct Model: Identifiable {
    var id: Int
    var path: String
    var description: String
}




struct trimodel: View {
    
    @State var modelList: [Model] = [
        Model(id: 1, path: "character.usdc", description: "This model was created using Blender and it's a basic character model."),
        Model(id: 2, path: "home_entrance.usdc", description: "This model was created using Blender and it is a replica of my home front entrance.")
    ]
    
    @State var index: Int = 0
    
    var body: some View {
   
        ZStack{
            VStack{
                
                SceneView(scene: SCNScene(named: modelList[index].path), options: [.autoenablesDefaultLighting, .allowsCameraControl])
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
                    .foregroundColor(Color.yellow)
                Text(modelList[index].description)
            }
            HStack {
                Button(action: {
                    withAnimation{
                        if index > 0 {
                            index -= 1
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 35, weight: .bold))
                })
                Spacer(minLength: 0)
                Button(action: {
                    withAnimation{
                        if index < modelList.count {
                            index += 1
                        }
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 35, weight: .bold))
                        .opacity(index == modelList.count - 1 ? 0.3 : 1)
                })
            }
        }
    }
}

struct _Dmodel_Previews: PreviewProvider {
    static var previews: some View {
        trimodel()
    }
}
