//
//  ListRowView.swift
//  TodoList
//
//  Created by Student on 3/14/22.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .orange : .blue)
            Text(item.title)
                .foregroundColor(item.isCompleted ? .gray : .black)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical,10)
    }
}

struct ListRowView_Previews: PreviewProvider {


    static var item1 = ItemModel(title: "first", isCompleted: false)
    static var item2 = ItemModel(title: "sec", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)

        }
        .previewLayout(.sizeThatFits)
    }
}
