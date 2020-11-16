//
//  TodoSheet.swift
//  Todo App
//
//  Created by Valentin Cernuta on 16/11/2020.
//

import SwiftUI

struct TodoSheet: View {
	
	@State var name: String
	@State var content: String
	@State var completed: Bool
	
    var body: some View {
		VStack(alignment: .leading) {
			Text("New Todo").font(.largeTitle).bold()
			
			TextField("Name", text: self.$name)
				.textFieldStyle(CustomTextFieldStyle())
				
			TextField("Content", text: self.$content)
				.textFieldStyle(CustomTextFieldStyle())

			HStack {
				Button(action: {self.completed.toggle()}) {
					Image(systemName: self.completed ? "checkmark.square.fill" : "square")
				}
				Text("Completed ?")
			}
			
			Spacer().frame(height: 32)
			
			Button(action: {}) {
				Text("Ajouter")
					.foregroundColor(Color.white)
					.padding(.vertical, 8)
					.padding(.horizontal, 16)
			}
			.background(Color.blue)
			.cornerRadius(16)
			
			Spacer()
		}.padding().padding(EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0))
    }
}

struct TodoSheet_Previews: PreviewProvider {
    static var previews: some View {
		TodoSheet(name: "", content: "", completed: false)
    }
}
