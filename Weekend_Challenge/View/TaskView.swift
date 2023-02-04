//
//  TaskView.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import SwiftUI


struct TaskView: View {
    
    
    @Environment(\.managedObjectContext)
    private var managedObjectContext
    
    @State private var isAddPressed:Bool = false
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @FetchRequest(entity: Task.entity(),sortDescriptors: [])
    var task: FetchedResults<Task>
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(taskViewModel.taskList){ taskIndex in
                    Text(taskIndex.taskName ?? "")
                }.onDelete{ offsets in
                    self.taskViewModel.deleteTask(offsets: offsets)
                }
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
                        TaskInsertionView()
                    }
                }
            }
        }
    }
}

    
    struct TaskView_Previews: PreviewProvider {
        static var previews: some View {
            TaskView().environmentObject(TaskViewModel())
        }
    }

