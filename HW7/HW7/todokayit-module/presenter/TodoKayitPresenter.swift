//
//  TodoKayitPresenter.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoKayitPresenter : ViewToPresenterTodoKayitProtocol{
    var todoKayitInteractor: PresenterToInteractorTodoKayitProtocol?
    
    func ekleCaller(todo_content: String) {
        todoKayitInteractor?.TodoEkle(todo_content: todo_content)
    }
    
}
