//  Store.swift

import Foundation

class Store :  ObservableObject{
    @Published var toDoItems: [toDoItem] = [] {
        didSet {
            saveToUserDefaults()
        }
    }

    private let userDefaultsKey = "toDoItemsKey"

    init() {
        loadFromUserDefaults()
    }

    // Save the current todo list to UserDefaults
    private func saveToUserDefaults() {
        if let encoded = try? JSONEncoder().encode(toDoItems) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }

    // Load the todo list from UserDefaults
    private func loadFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decoded = try? JSONDecoder().decode([toDoItem].self, from: data) {
            toDoItems = decoded}
//        } else {
//            // Provide default todos if none saved
//            toDoItems = [
//                toDoItem(title: "Buy milk", isDone: false),
//                toDoItem(title: "Learn Swift", isDone: false),
//                toDoItem(title: "Go for a walk", isDone: false)
//            ]
//        }
    }
    func deleteItem(_ item: toDoItem) {
        if let index = toDoItems.firstIndex(where: { $0.id == item.id }) {
            toDoItems.remove(at: index)
            saveToUserDefaults()  // save after deleting
        }
    }


    init(filename: String = "todoitems.json") {
        self.toDoItems = Bundle.main.decode(filename: filename, as: [toDoItem].self)
    }
}

