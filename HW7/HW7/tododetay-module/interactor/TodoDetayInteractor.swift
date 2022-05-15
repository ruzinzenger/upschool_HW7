//
//  TodoDetayInteractor.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoDetayInteractor : PresenterToInteractorTodoDetayProtocol{
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ajanda.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func todoGuncelle(todo_id: Int, todo_edit: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE todo_table SET todo_content = ? WHERE todo_id = ?", values: [todo_edit, todo_id])
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
}
