//
//  PersistenceContainer.swift
//  UI-127
//
//  Created by にゃんにゃん丸 on 2021/02/15.
//


import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
   
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TASK")
        
        //UnsafeRawBufferPointer with negative count 名前とXCdatamaodeldの名前が違うと出る
        //このエラーは@mainに.enviromentを書いていないときも出る
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
