//
//  ContentView.swift
//  MyCoreData
//
//  Created by Takumi_Hagi_BTC4 on 2023/06/15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //    @Environment・・・Environment_Valueを取り出すための記述
    @Environment(\.managedObjectContext) var viewContext

    //    @FetchRequestはデータを要求する時の記述
    //    sortDescriptorsはソートを指定する記述_今回は何も指定しないので[]
    //    FetchedResults<Human>という型にEntity（テーブル名みたいな）「Human」を指定
    @FetchRequest(sortDescriptors: [])var humans:FetchedResults<Human>

    @State var name = ""

    var body: some View {
        List{
            ForEach(humans){human in
                //                human.nameの名前が空でないか確認してテキスト化
                if((human.name?.isEmpty)==false){
                    HStack{
                        if(human.checked){
                            Text("✅")
                        }else{
                            Text("🟥")
                        }
                        Button(action: {human.checked.toggle()}) {
                            Text(human.name!)
                        }
                    }
                    //                    Text(human.name!)
                }
            }

            TextField("追加要素",text: $name)
                .onSubmit {
                    addHuman()
                }
            Button(action: deleteHuman) {
                Text("削除")
            }
            //            Button(action: addHuman, label: {Text("＋")})
        }
    }
    func addHuman(){
        //        HumanはEntityからリンクさせる
        //       引数はこれに揃える @Environment(\.managedObjectContext) var viewContext
        let newHuman=Human(context: viewContext)
        newHuman.name=name

        do{
            try viewContext.save()
        }catch{
            fatalError("追加：セーブに失敗")
        }
        name=""
    }

    func deleteHuman() {
        for human in humans{
            if(human.checked){
                viewContext.delete(human)
            }
        }
        do{
            try viewContext.save()
        }catch{
            fatalError("削除：セーブに失敗")
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

