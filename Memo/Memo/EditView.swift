//
//  EditVIew.swift
//  Memo
//
//  Created by K K on 2021/03/08.
//

import SwiftUI

struct EditView: View {
//    var ids : UUID
//    var titles : String
//    var texts : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var SaveAlert = false
    @State private var EmptyTitle = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Memos.date, ascending: true)],
                  animation: .default
    ) var Memo_array: FetchedResults<Memos>
    @State var title : String
    @State var text : String
    @State var id : UUID
    @State private var num : Int = 0
    

    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(spacing: 30){
            TextField("Title", text: $title)
            .frame(width : 335)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                    .padding(-5)
           )
            .offset(x: 0, y: 0)
            .padding(.top)
           
            TextEditor(text: $text)
            .frame(width : 345, height: 300)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                    
           )
            .offset(x: 0, y: 0)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save") {
                self.SaveAlert = true
            }
            .alert(isPresented: $SaveAlert) {
                Alert(title: Text("上書き保存しますか？"),
                      primaryButton : .cancel(Text("保存する"),action : createOverEntity),
                      secondaryButton : .default(Text("戻る")){
                        
                      }
                )
            }
            )
//　TextFieldが何も書かれていない時のプレイスホルダー
            if text.isEmpty {
                Text("text")
                        .font(.custom("Helvetica", size: 20))
                        .offset(x: -150, y: -325)
                        .foregroundColor(Color(UIColor.placeholderText))
                }
        }
        .frame(width: 500, height: .infinity)
        }
        
    }
    
    
    mutating func Number() {
        for j in 0 ... Memo_array.count - 1{
            if Memo_array[j].id == id{
                num = j
            }
        }
        
    }
    
    func createOverEntity() {
        for j in 0 ... Memo_array.count - 1{
            if Memo_array[j].id == id{
                num = j
            }
        }
        let memo = Memos(context: moc)
        memo.id = UUID()
        memo.text = text
        memo.date = Date()
        memo.title = title
        do {
            let Memo = Memo_array[num]
            moc.delete(Memo)
            try moc.save()
            self.presentationMode.wrappedValue.dismiss()
        } catch {
            
        }
    }
    
    
}
struct EditVIew_Previews: PreviewProvider {
    static var previews: some View {
        EditView(title : "", text : "",id : UUID())
    }
}
