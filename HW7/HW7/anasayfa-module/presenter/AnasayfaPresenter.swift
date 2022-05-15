//
//  AnasayfaPresenter.swift
//  HW7
//
//  Created by Irmak Zenger on 5/15/22.
//

import Foundation


class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func tumTodolariAlCaller() {
        anasayfaInteractor?.tumTodolariAl()
    }
    
    func todoAraCaller(arama_kelimesi: String) {
        anasayfaInteractor?.todoAra(arama_kelimesi: arama_kelimesi)
    }
    
    func todoSilCaller(todo_id: Int) {
        anasayfaInteractor?.todoSil(todo_id: todo_id)
    }
    
}


extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(todoListesi: Array<TodoItem>) {
        anasayfaView?.vieweVeriGonder(todoListesi: todoListesi)
    }
}
