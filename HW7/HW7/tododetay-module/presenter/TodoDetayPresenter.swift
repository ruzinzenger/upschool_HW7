//
//  TodoDetayPresenter.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoDetayPresenter : ViewToPresenterTodoDetayProtocol{
    
    var todoDetayInteractor: PresenterToInteractorTodoDetayProtocol?
    
    func guncelleCaller(todo_id: Int, todo_edit: String) {
        todoDetayInteractor?.todoGuncelle(todo_id: todo_id, todo_edit: todo_edit)
    }
    
}
