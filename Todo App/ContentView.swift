//
//  ContentView.swift
//  Todo App
//
//  Created by Valentin Cernuta on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showSheet: Bool = false	
	@State private var todos: [Todo] = allTodos
		
    var body: some View {
		NavigationView {
			List {
				Section(header: Text("Pinned todos")) {
					ForEach(todos.indices, id: \.self) { i in
						if todos[i].pinned {
							TodoItem(
								id: i,
								todo: todos[i],
								markAsCompleted: markAsCompleted,
								markAsPinned: markAsPinned
							)
						}
					}
				}
				
				Section(header: Text("All todos")) {
					ForEach(todos.indices, id: \.self) { i in
						if !todos[i].pinned {
							TodoItem(
								id: i,
								todo: todos[i],
								markAsCompleted: markAsCompleted,
								markAsPinned: markAsPinned
							)
						}
					}
				}
			}
			.listStyle(InsetGroupedListStyle())
			.navigationTitle("Todos App")
			.navigationBarItems(trailing: Button(action: {self.showSheet.toggle()}) {
				Image(systemName: "plus.circle").resizable().scaleEffect(1.3)
			})
		}.sheet(isPresented: self.$showSheet, content: {
			TodoSheet(name: "", content: "", completed: false)
		}).blur(radius: self.showSheet ? 3 : 0)
    }
	
	func markAsCompleted(id: Int) -> Void {
		todos[id].completed.toggle()
	}
	
	func markAsPinned(id: Int) -> Void {
		todos[id].pinned.toggle()
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
