//
//  TaskViewModel.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject{
    
    let task: TaskModel
    
    @Published var taskName: String = ""
    @Published var dueDate: Date = Date()
    @Published var notes: String = ""
    @Published var isCompleted: Bool = false
    
    init(task: TaskModel){
        self.task = task
        self.taskName = task.taskName
        self.notes = task.notes
        self.isCompleted = task.isCompleted
    }
    
    private func taskCompleted(){
        let completedTask = Task(context: PersistenceController.shared.container.viewContext)
        completedTask.isCompleted = true
    }
    
    private func addTask(){
        let addTask = Task(context: PersistenceController.shared.container.viewContext)
        addTask.taskName = taskName
        addTask.dueDate = dueDate
        addTask.isCompleted = false
        addTask.notes = notes
        
        
    }

    
    
    
}
