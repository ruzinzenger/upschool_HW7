//
//  TodoDetayProtocols.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


protocol ViewToPresenterTodoDetayProtocol{
    var todoDetayInteractor : PresenterToInteractorTodoDetayProtocol? {get set}
    
    func guncelleCaller(todo_id: Int, todo_edit : String)
    
}


protocol PresenterToInteractorTodoDetayProtocol{
    
    func todoGuncelle(todo_id: Int, todo_edit : String)
}

protocol PresenterToRouterTodoDetayProtocol{
    static func createModule(ref: TodoDetayVC)
}
