//
//  SecView.swift
//  Memo
//
//  Created by K K on 2021/03/07.
//

import SwiftUI

struct SecView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var SaveAlert = false
    @State private var TitleAlert = false
    @State private var EmptyTitle = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Memos.date, ascending: true)],animation: .default) var Memo_array: FetchedResults<Memos>
    @State var title : String = ""
    @State var text : String = ""

    var body: some View {
        ScrollView(showsIndicators: false) {
        VStack(spacing: 30){
        TextField("Title", text: $title)
            .frame(width : 335)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                   .padding(-5.0)
           )
            .offset(x: 0, y: 0)
            .padding(.top)
            
        TextEditor(text: $text)
            .frame(width : 335, height: 300)
            .overlay(
                   RoundedRectangle(cornerSize: CGSize(width: 8.0, height: 8.0))
                   .stroke(Color("Waku"), lineWidth: 4.0)
                   .padding(-5.0)
           )
            .offset(x: 0, y: 0)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save") {
                if title.isEmpty{
                    self.TitleAlert = true
                } else {
                    self.TitleAlert = false
                    self.SaveAlert = true
                }
            }
            .alert(isPresented: $SaveAlert) {
                Alert(title: Text("保存しますか？"),
                      primaryButton : .cancel(Text("保存する"),action : createNewEntity),
                      secondaryButton : .default(Text("戻る")){

                      }
                )
            }
            )
// TextFieldが何も書かれていない時のプレイスホルダー
            if text.isEmpty {
                Text("text")
                        .font(.custom("Helvetica", size: 20))
                        .offset(x: -150, y: -325)
                        .foregroundColor(Color(UIColor.placeholderText))
                }
            if title.isEmpty {
                
            }
        }
        .frame(width: 500, height: .infinity)
        }
        
    }
    func backHome() {
        self.presentationMode.wrappedValue.dismiss()
    }
    func createNewEntity() {
        let memo = Memos(context: moc)
        memo.id = UUID()
        memo.text = text
        memo.date = Date()
        memo.title = title
        do {
            try moc.save()
            self.presentationMode.wrappedValue.dismiss()
//            try NavigationLink(ContentView, destination: ContentView())
        } catch {
//            Alert(title: Text("miss"))
        }
    }

struct SecView_Previews: PreviewProvider {
    static var previews: some View {
        SecView()
    }
}
}
