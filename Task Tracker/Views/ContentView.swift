//
//  ContentView.swift
//  Task Tracker
//
//  Created by MARYANN KIMANI on 28/09/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var taskCount: Int = 0
    
    @Query private var tasks: [Task]
    
    @Environment(\.modelContext) private var modelContext
    
    @State private var newTasktitle = ""
    
    var body: some View {
        VStack {
            Text("Task Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            
            HStack{
                TextField("New Task", text: $newTasktitle)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    addTask()
                }
                .buttonStyle(.borderedProminent)
                .disabled(newTasktitle.isEmpty)
            }
            
            // Tasks List
            List {
                ForEach(tasks) {task in
                    HStack {
                        Text(task.title)
                            .strikethrough(task.isDone)
                        Image(systemName: task.isDone ? "checkmark.seal.fill" : "circlebadge") //cmd+shift+L
                    }
                    .onTapGesture {
                        toggleTask(task)
                    }
                }
                .onDelete(perform: deleteTask)
            }
            
        }
        .padding()
    }
    
    // Reactive Programming
    private func addTask() {
        let newTask = Task(title: newTasktitle)
        modelContext.insert(newTask) //Saving new task to the DB
        newTasktitle = ""
    }
    
    private func toggleTask(_ task: Task) {
        task.isDone.toggle()
    }
    
    //Deleting the task by swiping left
    private func deleteTask(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(tasks[index])
        }
    }
}

#Preview {
    ContentView()
}
