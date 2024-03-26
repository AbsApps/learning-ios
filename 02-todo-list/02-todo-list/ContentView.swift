//
//  ContentView.swift
//  02-todo-list
//
//  Created by Christian Rizo on 3/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var descriptionNote: String = ""
    @StateObject var notesViewModel = NotesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Add Task")
                    .underline()
                    .foregroundColor(.gray)
                    .padding(.horizontal, 16)
                TextEditor(text: $descriptionNote)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.green, lineWidth: 2)
                    )
                    .padding(.horizontal, 12)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                Button("Crear") {
//                    print("Crear Nota")
                    notesViewModel.saveNote(description: descriptionNote)
                    descriptionNote = ""
                }
                .buttonStyle(.bordered)
                .tint(.green)
                Spacer()
                
                List{
                    ForEach($notesViewModel.notes, id:\.id) { $note in
                        HStack {
                            if note.isFavorited {
                                Text("⭐️")
                            }
                            Text(note.description)
                        }
                        .swipeActions(edge:.trailing) {
                            Button {
                                notesViewModel.updateFavoriteNote(note: $note)
                            } label: {
                                Label("Favorite", systemImage: "star.fill")
                            }
                            .tint(.yellow)
                        }
                        .swipeActions(edge:.leading) {
                            Button {
                                notesViewModel.removeNote(withId: note.id)
                            } label: {
                                Label("Borrar", systemImage: "trash.fill")
                            }
                            .tint(.red)
                        }
                        
                        
                    }
                }
            }
            .navigationTitle("Todo List")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Text(notesViewModel.getNumberOfNotes())
            }
        }
    }
}

#Preview {
    ContentView()
}
