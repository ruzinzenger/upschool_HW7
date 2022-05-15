//
//  TodoDetayRouter.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoDetayRouter : PresenterToRouterTodoDetayProtocol{
    
    static func createModule(ref: TodoDetayVC) {
        // view
        ref.todoDetayPresenterNesnesi = TodoDetayPresenter()
        
        // presenter
        ref.todoDetayPresenterNesnesi?.todoDetayInteractor = TodoDetayInteractor()
    }
    
    
}
