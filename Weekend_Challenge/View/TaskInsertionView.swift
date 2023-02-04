//
//  TaskInsertionView.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import SwiftUI

struct TaskInsertionView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var taskViewModel: TaskViewModel
    
    @State private var taskName: String = ""
    @State private var dueDate: Date = Date()
    @State private var isCompleted: Bool = false
    @State private var notes: String = ""
    
    
    var body: some View {
        NavigationStack {
            Form{
                Section("Name of the task"){
                    TextField("Task", text: $taskName)
                }
                Section("Due Date"){
                    DatePicker("Deadline day:", selection: $dueDate, in: Date()..., displayedComponents: .date)
                }
            }.navigationTitle("Add a new task")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Done"){
                            dismiss()
                            taskViewModel.addTask(taskName: taskName, dueDate: dueDate)
                        }
                    }
                }
        }
    }
}

struct TaskInsertionView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInsertionView()
    }
}
