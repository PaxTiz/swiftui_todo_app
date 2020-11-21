//
//  todos.swift
//  Todo App
//
//  Created by Valentin Cernuta on 16/11/2020.
//

import Foundation

let allTodos: [Todo] = [
	Todo(
		name: "Work Hard !",
		content: "I need to finish this app soon",
		completed: false,
		pinned: false,
		deadline: Date(timeIntervalSince1970: TimeInterval(1000))
	),
	Todo(
		name: "Complete this app",
		content: "I need to finish this app soon, I need to finish this app soon, I need to finish this app soon",
		completed: false,
		pinned: true,
		deadline: Date(timeIntervalSince1970: TimeInterval(10000))
	),
	Todo(
		name: "Learn more of SwiftUI",
		content: "Make SwiftUI Great Again (what ?)",
		completed: false,
		pinned: false,
		deadline: Date(timeIntervalSince1970: TimeInterval(8361))
	)
].sorted(by: {(t1: Todo, t2: Todo) -> Bool in
	if t1.completed && !t2.completed {
		return false
	}
	return true
})
