//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Matteus Schmidt on 9/7/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    // instead of creating the viewmodel as a stored member, created as a state object and passing in the view model with the associated userId
    @StateObject var viewModel: ToDoListViewViewModel
    // pulling the dictionary variable made as collections in firebase
    // listens for live updates to the collection path
    @FirestoreQuery var items: [ToDoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        // user/<uid>/todos/<entries>
        // underscore for property wrappers
        // declaring items for display to the user
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        // _ is state object semantic, this code passes userId into the view model
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // displays the title of the item in the todos collection
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            // makes the plus sign in the toolbar in the top right
            .toolbar {
                Button {
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            // when we tap on the plus button we want to show the new item view as a sheet
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "30H4KB2EITO5RryiilELiMYgHYj2")
    }
}
