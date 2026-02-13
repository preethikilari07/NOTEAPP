// pushing to github
// first commit
//  ContentView.swift
//  NoteApp
//
//  Created by Kilari, Preethi Kilari on 2/13/26.
// test

import SwiftUI
 
struct ContentView: View {
    @StateObject var viewModel = NotesViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    HStack {
                        Text(note.title)
                            .strikethrough(note.isCompleted)
                        Spacer()
                        if note.isCompleted {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteNote)
            }
            .navigationTitle("My Notes")
            .toolbar {
                Button {
                    viewModel.addNote(title: "New Note", content: "Sample content")
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}
