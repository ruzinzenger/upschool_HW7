//
//  TodoKayitRouter.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class TodoKayitRouter : PresenterToRouterTodoKayitProtocol{
    
    static func createModule(ref: TodoKayitVC) {
        
        // view
        ref.todoKayitPresenterNesnesi = TodoKayitPresenter()
        
        // presenter
        ref.todoKayitPresenterNesnesi?.todoKayitInteractor = TodoKayitInteractor()
    }
    
    
    
    
}
