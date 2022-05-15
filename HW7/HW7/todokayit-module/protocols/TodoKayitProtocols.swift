//
//  TodoKayitProtocols.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


protocol ViewToPresenterTodoKayitProtocol{
    var todoKayitInteractor : PresenterToInteractorTodoKayitProtocol? {get set}
    
    func ekleCaller(todo_content: String)
    
}


protocol PresenterToInteractorTodoKayitProtocol{
    func TodoEkle(todo_content: String)
}



protocol PresenterToRouterTodoKayitProtocol{
    static func createModule(ref : TodoKayitVC)
}
