//
//  ContentView.swift
//  Todo App
//
//  Created by Valentin Cernuta on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showSheet: Bool = false
	@State private var showDelete: Bool = false
	@State private var todos: [Todo] = allTodos.sorted(by: {(t1: Todo, t2: Todo) -> Bool in
		if t1.completed && !t2.completed {
			return false
		}
		return true
	})
	
    var body: some View {
		NavigationView {
			List {
				ForEach(todos.indices, id: \.self) { i in
					HStack {
						VStack(alignment: .leading) {
							Text(todos[i].name).font(.headline)
							Text(todos[i].content)
								.lineLimit(1)
						}
						Spacer()
						Button(action: {markAsCompleted(id: i)}) {
							Image(systemName: todos[i].completed ? "checkmark.square.fill" : "square")
						}
					}
					.padding(EdgeInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0)))
					.contextMenu(menuItems: {
						Button(action: {}) {
							Image(systemName: "pin").background(Color.red)
							Text("Pin")
						}
						Button(action: {}) {
							Image(systemName: "trash").background(Color.red)
							Text("Delete")
						}
					})
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
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
