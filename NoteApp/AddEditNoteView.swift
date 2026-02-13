//
//  AddEditNoteView.swift
//  NoteApp
//
//  Created by Kilari, Preethi Kilari on 2/13/26.
//

import Foundation
import SwiftUI
 
struct AddEditNoteView: View {
    var note: Note? = nil
    @ObservedObject var viewModel: NotesViewModel
 
    @State private var title: String = ""
    @State private var content: String = ""
    @Environment(\.dismiss) private var dismiss
 
    var body: some View {
        Form {
            TextField("Title", text: $title)
 
            TextEditor(text: $content)
                .frame(height: 200)
        }
        .navigationTitle(note == nil ? "Add Note" : "Edit Note")
        .toolbar {
            Button("Save") {
                if let existing = note {
                    viewModel.updateNote(note: existing, title: title, content: content)
                } else {
                    viewModel.addNote(title: title, content: content)
                }
                dismiss()
            }
        }
        .onAppear {
            if let existing = note {
                title = existing.title
                content = existing.content
            }
        }
    }
}
