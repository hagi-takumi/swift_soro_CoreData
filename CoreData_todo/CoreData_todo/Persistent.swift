//
//  Persistent.swift
//  MyCoreData
//
//  Created by Takumi_Hagi_BTC4 on 2023/06/15.
//

import CoreData

//Core Dataスタックを初期化し、永続ストアをロードするためのコンテナを提供する役割
struct PersistenceController{
    //    コンテナ作成（NSPersistentContainer型）
    let container:NSPersistentContainer

    init(){
        //        大枠のコンテナを作成（"MyCoreData"という名前のモデルファイルを使用）
        container=NSPersistentContainer(name: "MyCoreData")
        //        PersistentStoreを読み込み作成したことがなければ作成
        //        完了時に指定したクロージャが呼び出されます
        container.loadPersistentStores(
            //            作成が完了したときに呼ばれるクロージャー
            completionHandler: {(storeDescription,error)in
                //            アプリケーションをクラッシュさせるためにfatalError関数
                //            失敗したらデータを落とす指示
                if let error = error as NSError?{
                    fatalError("Unresolved error \(error)")
                }
            })
    }
}

