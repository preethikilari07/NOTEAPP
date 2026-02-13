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

            ZStack {

                // Gradient Background (compatible)

                LinearGradient(

                    gradient: Gradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.2)]),

                    startPoint: .topLeading,

                    endPoint: .bottomTrailing

                )

                .ignoresSafeArea()
 
                List {

                    ForEach(viewModel.notes) { note in

                        NavigationLink {

                            NoteDetailView(note: note, viewModel: viewModel)

                        } label: {

                            HStack {

                                VStack(alignment: .leading, spacing: 6) {
 
                                    Text(note.title)

                                        .font(.system(size: 20, weight: .bold))

                                        .foregroundColor(note.isCompleted ? .gray : .primary)

                                        .strikethrough(note.isCompleted)

                                        .kerning(0.5)
 
                                    Text(note.content)

                                        .font(.system(size: 16))

                                        .foregroundColor(.secondary)

                                        .lineSpacing(4)

                                        .lineLimit(1)

                                }
 
                                Spacer()
 
                                if note.isCompleted {

                                    Image(systemName: "checkmark.circle.fill")

                                        .foregroundColor(.green)

                                }

                            }

                            .padding(.vertical, 6)

                        }

                    }

                    .onDelete(perform: viewModel.deleteNote)

                }

                .background(Color.clear)

                .scrollContentBackground(.hidden) // If this line causes error, delete ONLY this line.

            }

            .navigationTitle("My Notes")

            .toolbar {

                NavigationLink {

                    AddEditNoteView(viewModel: viewModel)

                } label: {

                    Image(systemName: "plus")

                }

            }

        }

    }

}

 
