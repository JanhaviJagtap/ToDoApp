//
//  ContentView.swift
//  ToDoApp_Week3
//
//  Created by Janhavi Jagtap on 13/8/2025.
//

import SwiftUI

struct ContentView: View {
    var toDoItem: toDoItem
    @ObservedObject var store:Store
    //@State private var mytodos = todos
    @State private var userInput = ""
    
    var body: some View {
        NavigationView{
            VStack (alignment: .leading){
                Text("My To Dos")
                    .font(.title)
                    .padding(.vertical, 30)
                ForEach($store.toDoItems){$toDoItem in
                    HStack{
                        Button{toDoItem.isDone.toggle() }label:{buttonToggler(isDone: toDoItem.isDone)}
                        Text("\(toDoItem.title)")
                            .font(.headline)
                            .padding(3)
                        Spacer()
                        Button{}
                        label:{Image(systemName: "pencil")}
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
            }
            .padding(10)
        }
    }
    func buttonToggler(isDone: Bool) -> some View{
        if(isDone==false){
            return Image(systemName: "square")
        }else{
            return Image(systemName: "checkmark.square.fill")

        }
    }
    
}

#Preview {
    ContentView(toDoItem: todos[0], store: Store())
}
