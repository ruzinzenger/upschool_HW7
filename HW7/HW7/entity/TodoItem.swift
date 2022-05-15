//
//  TodoItem.swift
//  HW7
//
//  Created by Irmak Zenger on 5/14/22.
//

import Foundation

class TodoItem {
    var todo_id : Int?
    var todo_content : String?
    
    init(todo_id :Int, todo_content : String){
        self.todo_id = todo_id
        self.todo_content = todo_content
    }
}
