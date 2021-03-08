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
//                List(Memo_array,id:\.self) {
//                    memo in Text(" \(memo.title!)")
                List {
                    
                    ForEach(Memo_array, id: \.self) { i in NavigationLink(destination: SecView()) {
                        Text(i.title! ?? "Noname")
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
//    func Remove(offsets: IndexSet) {
//        Memo_array.remove(atOffsets: offsets)
//        }
              
}
// View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
            ContentView()
    }
}
