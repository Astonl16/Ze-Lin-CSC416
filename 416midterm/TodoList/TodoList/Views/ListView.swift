//
//  ListView.swift
//  TodoList
//
//  Created by Student on 3/14/22.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel


    var body: some View {
        List{
            ForEach(listViewModel.items){item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item:item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
                trailing:
                NavigationLink("Add", destination: AddView()))

    }





}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        ListView()
        }
        .environmentObject(ListViewModel())
    }

}


