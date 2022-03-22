//
//  ListViewModel.swift
//  TodoList
//
//  Created by Student on 3/14/22.
//

import Foundation

class ListViewModel: ObservableObject{

    @Published var items: [ItemModel] = []
    let itemKey: String = "items_list"

    init(){
        getItems()
    }


    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let saveitems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        items.append(contentsOf: saveitems)
        saveItem()
    }

    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
        saveItem()
    }

    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        saveItem()
    }

    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        saveItem()
    }
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }    }

}
