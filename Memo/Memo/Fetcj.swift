//
//  Fetcj.swift
//  Memo
//
//  Created by K K on 2021/03/04.
//

struct ContentView: View {
    @State private var taskName: String = ""
    @Environment(\.managedObjectContext) var context
    @FetchRequest(
        entity: Memos.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Memos.dateAdded, ascending: true)],
        predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: false))
    ) var notCompletedTasks: FetchedResults<Memos>

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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
}

