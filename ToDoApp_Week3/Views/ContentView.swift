//
//  ContentView.swift
//  ToDoApp_Week3
//
//  Created by Janhavi Jagtap on 13/8/2025.
//

import SwiftUI

struct ContentView: View {
    var toDoItem: toDoItem
    @State private var showPopup = false
    @ObservedObject var store:Store
    //@State private var mytodos = todos
    @State private var userInput = ""
    @State private var updatedInput = ""
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Text("My To Do List")
                    .font(.title)
                    .padding(30)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .frame(height: 50)
                    .padding(.bottom, 50)
                
                ForEach($store.toDoItems){$toDoItem in
                    HStack{
                        Button{toDoItem.isDone.toggle() }label:{buttonToggler(isDone: toDoItem.isDone)}
                        Text("\(toDoItem.title)")
                            .font(.headline)
                            .padding(3)
                        Spacer()
                        Button{showPopup=true}
                        label:{Image(systemName: "pencil")}
                            .padding(.horizontal,5)
                        Button() {
                            store.deleteItem(toDoItem)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }.padding(15)
                        .padding(.horizontal, 15)
                        .sheet(isPresented: $showPopup) {
                        
                            PopupView(updatedInput: $toDoItem.title, store: store)
                            .presentationDetents([.medium, .large])
                            .presentationDragIndicator(.visible)
                    
                }
                
                }
                
                Spacer()
                HStack{
                    TextField("Input a To Do item", text: $userInput)
                    Button{
                        store.toDoItems.append(ToDoApp_Week3.toDoItem(title: userInput, isDone: false))
                        userInput=""
                    }label: {
                        Text("Add To Do")
                    }
                }
                .padding(20)
                .padding(.top, 20)
                .background(.white)
            }
            .background(.yellow.opacity(0.2))
            
        }
    }
    func buttonToggler(isDone: Bool) -> some View{
        if(isDone==false){
            return Image(systemName: "square")
        }else{
            return Image(systemName: "checkmark.square.fill")

        }
    }
    struct PopupView: View {
        @Binding var updatedInput: String
        
        @ObservedObject var store: Store
        var body: some View {
            VStack(spacing: 20) {
                Text("Update To Do item")
                    .font(.title)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .padding(10)
                TextField("Enter updated To Do item", text: $updatedInput)
                    .padding(20)
                    .background(.white)
                    .font(.callout)
                    .padding(10)
                    .cornerRadius(10)
                Button{}label: {
                    Text("Update")
                }
                

                Spacer()
            }
            .background(.green.opacity(0.2))
        }
    }
    
}

#Preview {
    ContentView(toDoItem: todos[0], store: Store())
}
