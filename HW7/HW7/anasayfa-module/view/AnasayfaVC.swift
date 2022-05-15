//
//  ViewController.swift
//  HW7
//
//  Created by Irmak Zenger on 5/14/22.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var todoListTableView: UITableView!
    
    var todoList = [TodoItem]()
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        todoListTableView.delegate = self
        todoListTableView.dataSource = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
        
        
    }
    
    // we want changes made in todokayit and tododetay to affect the main list each time we navigate back to it
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.tumTodolariAlCaller()
    }
    
    // This is how we pass the 'clicked_item' variable (inside didSelectRowAt method) into the todo_item variable of TodoDetayVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let cur_todo_item = sender as? TodoItem{
                let gidilecekVC = segue.destination as! TodoDetayVC
                gidilecekVC.todo_item = cur_todo_item
            }
        }
    }
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "ajanda", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("ajanda.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabani zaten var")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch{}
            
        }
    }
    
}


extension AnasayfaVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.todoAraCaller(arama_kelimesi: searchText)
    }
}


extension AnasayfaVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = todoList[indexPath.row]
        
        // getting the next prototype cell in tableView (currently empty) and casting it into the type of our cell
        // the identifier would be useful for cases where our view controller has multiple table views but for this app it is only for syntactical correctness
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todoHucre", for: indexPath) as! TableViewHucre
        
        // transfering the content of the TodoItem into the label of the TableViewHucre object
        hucre.todoContentLabel.text = item.todo_content
        
        return hucre
    }
    
    // defines what happens when swiping on a cell from the right
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, void) in
            
            let item = self.todoList[indexPath.row]
            let item_content = item.todo_content!
            let len : Int = item_content.count
            var subs = item_content
            if(len > 7){
                let startIndex = item_content.index(item_content.startIndex, offsetBy: 0)
                let endIndex = item_content.index(item_content.startIndex, offsetBy: 6)
                subs = String(item_content[startIndex...endIndex])
                subs = subs + "..."
            }
            
            let alert = UIAlertController(title: "Deleting ToDo Item '\(subs)'", message: "Are you sure?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "Cancel", style: .cancel) { action in}
            let evetAction = UIAlertAction(title: "Confirm", style: .destructive) { action in
                self.anasayfaPresenterNesnesi?.todoSilCaller(todo_id: item.todo_id!)
            }
            
            alert.addAction(iptalAction)
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }

        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    // defines what happens when we select a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clicked_item = todoList[indexPath.row]
        
        // this call also calls the prepare() method defined in main body above
        performSegue(withIdentifier: "toDetay", sender: clicked_item)
        
        // we don't want the selection animation to get stuck after the click
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
}


extension AnasayfaVC : PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(todoListesi: Array<TodoItem>) {
        self.todoList = todoListesi
        // re-calls the methods defined in the TableView protocols extension above
        self.todoListTableView.reloadData()
    }
}
