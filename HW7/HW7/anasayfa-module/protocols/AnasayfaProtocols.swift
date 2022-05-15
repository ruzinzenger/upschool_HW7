//
//  AnasayfaProtocols.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation

// Ana protokoller
protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func tumTodolariAlCaller()
    func todoAraCaller(arama_kelimesi : String)
    func todoSilCaller(todo_id : Int)
    
}

protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumTodolariAl()
    func todoAra(arama_kelimesi : String)
    func todoSil(todo_id : Int)
    
}


// Tasiyici protokoller

protocol InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(todoListesi: Array<TodoItem>)
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(todoListesi: Array<TodoItem>)
    
}



// Router protokolu
protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC)
}
