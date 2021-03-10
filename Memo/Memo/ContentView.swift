//
//  ContentView.swift
//  Memo
//
//  Created by K K on 2021/03/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // CoreDataの中身をMemo_arrayに入れる
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Memos.date, ascending: true)],animation: .default) var Memo_array: FetchedResults<Memos>
    

        var body: some View {
            NavigationView {
                List {
                    
                    ForEach(Memo_array, id: \.self) { i in NavigationLink(destination: EditView(title : i.title!, text : i.text!, id : i.id!)) {
                        Text(i.title!)
                    }
                    
                    }
                    .onDelete(perform: Remove)
                }
//            .onDelete(perform: Remove)
                .navigationTitle("Memo")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: EditButton(),
                trailing: NavigationLink(destination: SecView(), label: { Image(systemName: "plus") }))
            
            }
            
        }
    func Remove(at offsets: IndexSet) {
        for index in offsets {
            let Memo = Memo_array[index]
            moc.delete(Memo)
        }
        do {
            try moc.save()
        } catch {
            // handle the Core Data error
        }
    }
}
// View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
