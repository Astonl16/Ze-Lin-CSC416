//
//  AddView.swift
//  TodoList
//
//  Created by Student on 3/14/22.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertMessage: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("type something", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:50)
                    .background(Color(hue: 0.675, saturation: 0.034, brightness: 0.879))
                    .cornerRadius(15)

                Button(action:saveButton, label: {
                    Text("Done")
                        .frame(height:50)
                })


            }
            .padding(14)
        }
        .alert(alertMessage, isPresented: $showAlert, actions:{Text(alertMessage)})
        .navigationTitle("Add an Item")
    }

    func saveButton(){
        if(textFieldText.count > 0){
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }else{
            alertMessage = "You have type something"
            showAlert.toggle()

        }

    }




}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
