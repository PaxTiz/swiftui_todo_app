//
//  TodoItem.swift
//  Todo App
//
//  Created by Valentin Cernuta on 21/11/2020.
//

import SwiftUI

struct TodoItem: View {
	
	var id: Int
	var todo: Todo
	var markAsCompleted: (Int) -> Void
	var markAsPinned: (Int) -> Void
	
    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(todo.name).font(.headline)
				Text(todo.content).lineLimit(1)
				Spacer().frame(height: 8)
				Text("\(Int(DateInterval(start: todo.deadline, end: Date()).duration * 60)) minutes restantes")
					.font(.subheadline)
			}
			Spacer()
			Button(action: {markAsCompleted(id)}) {
				Image(systemName: todo.completed ? "checkmark.square.fill" : "square")
			}
		}
		.padding(EdgeInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0)))
		.contextMenu(menuItems: {
			Button(action: {markAsPinned(id)}) {
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

//struct TodoItem_Previews: PreviewProvider {
//	@State private var todos = allTodos
//    static var previews: some View {
//        TodoItem(
//			todo: todos[0],
//			markAsCompleted: markAsCompleted,
//			markAsPinned: markAsPinned
//		)
//    }
//
//	func markAsCompleted(id: UUID) -> Void {
//	}
//
//	func markAsPinned(id: UUID) -> Void {
//	}
//}
