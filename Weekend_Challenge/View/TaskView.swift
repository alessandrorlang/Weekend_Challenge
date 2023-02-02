//
//  TaskView.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import SwiftUI


struct TaskView: View {
    
    @State private var isAddPressed:Bool = false

    @EnvironmentObject var taskModel: TaskViewModel

    @Environment(\.managedObjectContext)
        private var managedObjectContext

    @FetchRequest(entity: Task.entity(),sortDescriptors: [])
        var task: FetchedResults<Task>

    
    var body: some View {
        NavigationStack{
            List{
               Text("Hello")
            }
            .navigationTitle("Today's Task")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        isAddPressed.toggle()
                    }){
                        Image(systemName: "plus")
                            .foregroundColor(.blue)
                            .font(.system(size: 24, weight: .bold))
                    }.sheet(isPresented: $isAddPressed){
                        NavigationStack {
                            TaskInsertionView().navigationTitle("Add a new task")
                        }.toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button("Done"){
                                    print("Done")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
