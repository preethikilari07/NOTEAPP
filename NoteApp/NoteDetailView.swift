//
//  NoteDetailView.swift
//  NoteApp
//
//  Created by Kilari, Preethi Kilari on 2/13/26.
//

import Foundation
import SwiftUI
 
struct NoteDetailView: View {

    var note: Note

    @ObservedObject var viewModel: NotesViewModel
 
    var body: some View {

        VStack(alignment: .leading, spacing: 16) {
 
            Text(note.title)

                .font(.title)

                .strikethrough(note.isCompleted)
 
            Text(note.content)

                .font(.body)
 
            Button {

                viewModel.toggleCompletion(note: note)

            } label: {

                Text(note.isCompleted ? "Mark Incomplete" : "Mark Completed")

                    .frame(maxWidth: .infinity)

                    .padding()

                    .background(note.isCompleted ? Color.orange : Color.green)

                    .foregroundColor(.white)

                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.2), radius:5, x: 0, y:4)

            }
 
            Spacer()

        }

        .padding()

        .navigationTitle("Details")

        .toolbar {

            NavigationLink("Edit") {

                AddEditNoteView(note: note, viewModel: viewModel)

            }

        }

    }

}

 
