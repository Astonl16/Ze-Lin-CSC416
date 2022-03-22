//
//  TodoListApp.swift
//  TodoList
//
//  Created by Student on 3/14/22.
//

import SwiftUI

@main
struct TodoListApp: App {


    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
