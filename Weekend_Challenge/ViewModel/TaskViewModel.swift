//
//  TaskViewModel.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import Foundation
import CoreData

class TaskViewModel: ObservableObject{

    @Published var taskList: [Task] = []
    
    init(){
        fetchTask()
    }
    
    func taskCompleted(){
        let completedTask = Task(context: PersistenceController.shared.container.viewContext)
        completedTask.isCompleted = true
    }
    
     func addTask(taskName:String, dueDate:Date){
        let addTask = Task(context: PersistenceController.shared.container.viewContext)
        addTask.taskName = taskName
        addTask.dueDate = dueDate
//        addTask.isCompleted = false
//        addTask.notes = notes
        
        saveTask()
    }
    
     func fetchTask(){
        let request = NSFetchRequest<Task>(entityName: "Task")

        do{
            taskList = try PersistenceController.shared.container.viewContext.fetch(request)
        } catch {
            print("Error fetching: \(error)")
        }
        
    }
    
    func deleteTask(offsets: IndexSet){
        offsets.map{
            taskList[$0]
        }.forEach(PersistenceController.shared.container.viewContext.delete)
        saveTask()
    }
    
     func saveTask(){
            do{
                try PersistenceController.shared.container.viewContext.save()
                self.fetchTask()
            } catch let error {
                print("An Error has occured: \(error)")
            }
    }
    
}
