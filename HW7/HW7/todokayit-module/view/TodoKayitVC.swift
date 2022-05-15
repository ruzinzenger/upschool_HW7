//
//  TodoKayitVC.swift
//  HW7
//
//  Created by Irmak Zenger on 5/14/22.
//

import UIKit

class TodoKayitVC: UIViewController {

    @IBOutlet weak var todoTextField: UITextField!
    
    var todoKayitPresenterNesnesi : ViewToPresenterTodoKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TodoKayitRouter.createModule(ref: self)
    }
    

    @IBAction func addButtonTikla(_ sender: Any) {
        if let todo_input = todoTextField.text{
            todoKayitPresenterNesnesi?.ekleCaller(todo_content: todo_input)
        }
    }
    
    
}
