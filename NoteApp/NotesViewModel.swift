//
//  NotesViewModel.swift
//  NoteApp
//
//  Created by Kilari, Preethi Kilari on 2/13/26.
//
import SwiftUI
import Combine
 
class NotesViewModel: ObservableObject {
 
    @AppStorage("savedNotes") private var savedNotesData: Data = Data()
 
    @Published var notes: [Note] = [] {
        didSet {
            saveNotes()
        }
    }
 
    init() {
        loadNotes()
    }
 
    func addNote(title: String, content: String) {
        let newNote = Note(title: title, content: content, isCompleted: false)
        notes.append(newNote)
    }
 
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
    }
    func updateNote(note: Note, title: String, content: String) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].title = title
            notes[index].content = content
        }
    }
 
    func toggleCompletion(note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index].isCompleted.toggle()
        }
    }
 
    private func saveNotes() {
        do {
            let encoded = try JSONEncoder().encode(notes)
            savedNotesData = encoded
        } catch {
            print("Error saving notes: \(error)")
        }
    }
 
    private func loadNotes() {
        guard !savedNotesData.isEmpty else {
            notes = []
            return
        }
        do {
            notes = try JSONDecoder().decode([Note].self, from: savedNotesData)
        } catch {
            notes = []
            print("Error loading notes: \(error)")
        }
    }
}
