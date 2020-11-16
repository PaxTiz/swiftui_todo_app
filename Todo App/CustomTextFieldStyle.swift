//
//  CustomTextFieldStyle.swift
//  Todo App
//
//  Created by Valentin Cernuta on 16/11/2020.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
	
	func _body(configuration: TextField<Self._Label>) -> some View {
		configuration
			.foregroundColor(Color.white)
			.padding()
			.background(Color.gray.opacity(0.2))
			.cornerRadius(16)
	}
 
}
