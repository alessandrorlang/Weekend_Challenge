//
//  TaskInsertionView.swift
//  Weekend_Challenge
//
//  Created by Alessandro Airlangga Hariadi on 02/02/23.
//

import SwiftUI

struct TaskInsertionView: View {
    
    @State private var taskName: String = ""
    @State private var dueDate: Date = Date()
    
    var body: some View {
        Form{
            Section("Name of the task"){
                TextField("Task", text: $taskName)
            }
            Section("Due Date"){
                DatePicker("Deadline day:", selection: $dueDate, in: Date()..., displayedComponents: .date)
            }
        }
    }
}

struct TaskInsertionView_Previews: PreviewProvider {
    static var previews: some View {
        TaskInsertionView()
    }
}
