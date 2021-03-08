
//  ContentView.swift
//  Memo
//
//  Created by K K on 2021/03/04.

// ココ以下を全てコメントアウト
import SwiftUI
import CoreData

struct Viewz: View {
    // リストの定義
//    let Title = ["hoge","huga"]
//    @State private var Title = ["hoge", "huga", "fizz", "buzz", "fizzbuzz"]
//
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Memos.date, ascending: true)],animation: .default) var Memo_array: FetchedResults<Memos>
//    @State private var Title = Set<Memos>()



        var body: some View {
            NavigationView {
                // Topに表示
                VStack {
                    Text("num of AppEntity  \(Memo_array.count)")
                    List(Memo_array, id:\.self) { title in
                        Text("UUID: \(title.date!)  String: \(title.text!)  Int64: \(title.title!)")

                }
                VStack  {
                    Button(action: {self.createNewEntity()},
                           label: {Text("Create a new Entity")}
                    )
                    Button(action: {self.deleteEntities()},
                           label: {Text("Delete selected Entities")}
                    )
                }

//                VStack{
//                    Button("item") {
//                        let memo = Memos(context: moc)
//                        memo.text = "TEST"
//                        memo.date = Date()
//                        memo.title = "Test"
//                        do {
//                            try moc.save()
//                        } catch {
//                            Alert(title: Text("miss"))
//                        }
//                    }

//                List {
////                    ForEach(Title, id: \.self) {
////                        fruit in Text(fruit)
//                    ForEach(Title, id: \.self) { i in
//                                        NavigationLink(destination: SecView()) {
//                                            Text(i as! DateInterval)
//                                        }
//                    }
                }
//                .navigationTitle("Memo")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(leading: EditButton(),trailing: NavigationLink(destination: SecView(), label: { Text("NewCreate") }))
//            }
//            }
        }


//Editでリムーブする．
//        func createNewEntity() {
//            // Entity作成
//        }
//        func deleteEntities() {
//            // Entity削除
//        }
    }
    func createNewEntity() {
        let memo = Memos(context: moc)
        memo.text = "TEST"
        memo.date = Date()
        memo.title = "Test"
        do {
            try moc.save()
        } catch {
            Alert(title: Text("miss"))
        }
    }
    func deleteEntities() {
        // Entity 削除
    }


struct SecView: View {
    @State var title : String = ""
    @State var text : String = ""
    var body: some View {
        VStack(spacing: 30){
        TextField("Title", text: $title)
            .frame(width : 350)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                   .padding(-5.0)
           )
            .offset(x: 0, y: 0)

        TextEditor(text: $text)
            .frame(width : 350, height: 550)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                   .padding(-5.0)
           )
            .offset(x: 0, y: 0)

        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
            Text("Save")
        }
        }

    }


// View
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Viewz ()
    }
}
}
//
//struct ContentView: View {
//    // リストの定義
////    let Title = ["hoge","huga"]
////    @State private var Title = ["hoge", "huga", "fizz", "buzz", "fizzbuzz"]
////
//    @Environment(\.managedObjectContext) var moc
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Memos.date, ascending: true)],animation: .default) var Title: FetchedResults<Memos>
////    @State private var Title = Set<Memos>()
//
//
//
//        var body: some View {
//            NavigationView {
//                VStack{
//                List {
////                    ForEach(Title, id: \.self) {
////                        fruit in Text(fruit)
//                    ForEach(Title, id: \.self) { i in
//                                        NavigationLink(destination: SecView()) {
//                                            Text(i)
//                                        }
//                    }
//                    .onDelete(perform: rowRemove)
//                }
//                .navigationTitle("Memo")
//                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarItems(leading: EditButton(),trailing: NavigationLink(destination: SecView(), label: { Text("NewCreate") }))
//            }
//            }
//        }
//
//
////Editでリムーブする．
//        func rowRemove(offsets: IndexSet) {
//            Title.remove(atOffsets: offsets)
//        }
//
//        func createNewEntity() {
//            // Entity作成
//        }
//        func deleteEntities() {
//            // Entity削除
//        }
//    }
//
//struct SecView: View {
//    @State var title : String = ""
//    @State var text : String = ""
//    var body: some View {
//        VStack(spacing: 30){
//        TextField("Title", text: $title)
//            .frame(width : 350)
//            .overlay(
//                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
//                   .stroke(Color("Waku"), lineWidth: 4.0)
//                   .padding(-5.0)
//           )
//            .offset(x: 0, y: 0)
//
//        TextEditor(text: $text)
//            .frame(width : 350, height: 550)
//            .overlay(
//                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
//                   .stroke(Color("Waku"), lineWidth: 4.0)
//                   .padding(-5.0)
//           )
//            .offset(x: 0, y: 0)
//
//        Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//            Text("Save")
//        }
//        }
//
//    }
//
//
//// View
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//            ContentView()
//    }
//}
//}
//
}
