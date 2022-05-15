//
//  AnasayfaInteractor.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    // we need this var & init() in all interactors
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("ajanda.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumTodolariAl() {
        db?.open()
        var liste = [TodoItem]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM todo_table", values: nil)
            
            while rs.next(){
                let item = TodoItem(todo_id: Int(rs.string(forColumn: "todo_id"))!, todo_content: rs.string(forColumn: "todo_content")!)
                liste.append(item)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(todoListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func todoAra(arama_kelimesi: String) {
        db?.open()
        var liste = [TodoItem]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM todo_table WHERE todo_content like '%\(arama_kelimesi)%'", values: nil)
            
            while rs.next(){
                let item = TodoItem(todo_id: Int(rs.string(forColumn: "todo_id"))!, todo_content: rs.string(forColumn: "todo_content")!)
                liste.append(item)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(todoListesi: liste)
            
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
    func todoSil(todo_id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM todo_table WHERE todo_id = ?", values: [todo_id])
            tumTodolariAl()
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
    
}
