//
//  ProjectsView.swift
//  My_Portfolio
//
//  Created by Marcos Borges on 2022-08-30.
//

import SwiftUI

struct ProjectsView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
      @FetchRequest(fetchRequest: Project.allItems()) var items:FetchedResults<Project>

    @State private var projectItems = [Project]()


    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
                ForEach(projectItems, id: \.self) { item in
                    Text(item.projectName!)
                }.onDelete(perform: deleteItems)
              }.navigationBarTitle("Data Core")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    Button(action: {
                        let project = Project()
                        self.projectItems.append(project)
                    }) {
                        Image(systemName: "plus")
                    }
                )
        }
    
    func deleteItems(at offsets: IndexSet) {
        projectItems.remove(atOffsets: offsets)
    }
}

    

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
