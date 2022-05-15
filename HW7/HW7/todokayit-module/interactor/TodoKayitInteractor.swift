//
//  TodoKayitInteractor.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoKayitInteractor : PresenterToInteractorTodoKayitProtocol {
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ajanda.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func TodoEkle(todo_content: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO todo_table (todo_content) VALUES (?)", values: [todo_content])
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
}
