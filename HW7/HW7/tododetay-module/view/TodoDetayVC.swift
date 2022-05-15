//
//  TodoDetayVC.swift
//  HW7
//
//  Created by Irmak Zenger on 5/14/22.
//

import UIKit

class TodoDetayVC: UIViewController {

    @IBOutlet weak var detayTextField: UITextField!
    
    var todo_item : TodoItem?
    var todoDetayPresenterNesnesi : ViewToPresenterTodoDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let ti = todo_item{
            detayTextField.text = ti.todo_content
        }
        
        TodoDetayRouter.createModule(ref: self)
    }
    


    @IBAction func updateButtonTikla(_ sender: Any) {
        if let todo_user_edit = detayTextField.text, let ti = todo_item{
            todoDetayPresenterNesnesi?.guncelleCaller(todo_id: ti.todo_id!, todo_edit: todo_user_edit)
        }
    }
    

    
}
