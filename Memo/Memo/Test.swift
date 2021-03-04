//
//  Test.swift
//  Memo
//
//  Created by K K on 2021/03/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var taskName: String = ""
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.dateAdded, ascending: true)],
        predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
    ) var notCompletedTasks: FetchedResults<Task>

    var body: some View {
        VStack {
            HStack {
                TextField("Task Name", text: $taskName)
                Button(action: {
                    self.addTask()
                    self.taskName = ""
                }) {
                    Text("Add Task")
                }
            }.padding()
            List {
                ForEach(notCompletedTasks, id: \.self.id) { task in
                    Button(action: {
                        self.updateTask(task)
                    }) {
                        Text(task.name ?? "No name given")
                    }
                }
            }
        }
    }
    
    func addTask() {
        let newTask = Task(context: context)
        newTask.id = UUID()
        newTask.name = taskName
        newTask.isComplete = false
        newTask.dateAdded = Date()
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
    
    func updateTask(_ task: Task){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Task")
        fetchRequest.predicate = NSPredicate(format: "id == %@", task.id! as NSUUID as CVarArg)
        fetchRequest.fetchLimit = 1
        
        do {
            let taskUpdate = try context.fetch(fetchRequest)[0] as! NSManagedObject
            taskUpdate.setValue(true, forKey: "isComplete")
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate)
            .persistentContainer.viewContext
        return ContentView().environment(\.managedObjectContext, context)
    }
}
