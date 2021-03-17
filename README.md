## インターンシップ課題
# 文字数がわかる”すごい”メモアプリ 
iOS向けのメモアプリを自作しました

メモはiPhone内のROMに保存できます．

メモの文字数が表示されるので文字制限があるものを書くときにおすすめ．


## 使ったもの
  - Xcode 12.3
  - SwiftUI
  - CoreData

### CoreDataについて
使用しているエンティティは以下の通り
<img width="636" alt="スクリーンショット 2021-03-17 19 21 51" src="https://user-images.githubusercontent.com/65950135/111453263-b9424f80-8756-11eb-9321-ef1e96cc6aa3.png">

- Entity : Memos
  - Attribute : date <p> Type : Date
  - Attribute : id <p>  Type : UUID
  - Attribute : text <p> Type : String
  - Attribute : title <p> Type : String


## TOP画面
![IMG_0816](https://user-images.githubusercontent.com/65950135/111453560-0cb49d80-8757-11eb-9312-d9192c684c0e.PNG)

### 削除UI
![IMG_0817](https://user-images.githubusercontent.com/65950135/111453556-0c1c0700-8757-11eb-8411-7476db0111fa.PNG)

![IMG_0818](https://user-images.githubusercontent.com/65950135/111453554-0c1c0700-8757-11eb-8b0a-bb69922dcdf1.PNG)

スライドでも削除ができます．

![IMG_0819](https://user-images.githubusercontent.com/65950135/111453551-0b837080-8757-11eb-8506-6939e8668a0b.PNG)



## 新規メモ追加画面・メモ編集画面

### 新規メモ追加画面
![IMG_0820](https://user-images.githubusercontent.com/65950135/111453548-0aeada00-8757-11eb-9009-6b57b284237b.PNG)

### メモ編集画面
![IMG_0815](https://user-images.githubusercontent.com/65950135/111453540-09211680-8757-11eb-9937-c0e4000a4573.PNG)

## 今後やりたいこと
- UIをもっとCOOLにしたい．
- メモに画像を挿入できる機能を実装したい．


