//
//  Todo.swift
//  Todo App
//
//  Created by Valentin Cernuta on 15/11/2020.
//

import Foundation

struct Todo: Hashable {
	
	let id: UUID = UUID()
	var name: String
	var content: String
	var completed: Bool
	var pinned: Bool
	
}
