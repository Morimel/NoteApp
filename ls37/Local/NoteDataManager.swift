//
//  NoteDataManager.swift
//  ls37
//
//  Created by Isa Melsov on 15/12/23.
//

import Foundation
import CoreData
import UIKit

final class NoteDataManager: NSObject {
    static let shared = NoteDataManager()
    private override init() {
        
    }
    
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistenContainer.viewContext
    }
    
    func addNote(id: String, title: String, description: String, date: String) {
        guard let noteEntity = NSEntityDescription.entity(forEntityName: "Note", in: context) else {
            return
        }
        
        let note = Note(entity: noteEntity, insertInto: context)
        note.id = id
        note.title = title
        note.details = description
        note.date = date
        
        appDelegate.saveContext()
    }
    
    func fetchNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            return try context.fetch(fetchRequest) as! [Note]
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func deleteNote(id: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            guard let notes = try context.fetch(fetchRequest) as? [Note], let note = notes.first(where: {$0.id == id}) else {
                return
            }
            context.delete(note)
        } catch {
            print(error.localizedDescription)
        }
        
        appDelegate.saveContext()
    }
    
    func clearNotes() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            let notes = try context.fetch(fetchRequest) as? [Note]
            notes?.forEach({note in
                context.delete(note)
                //context.delete($0)
            })
        } catch {
            print(error.localizedDescription)
        }
        
        appDelegate.saveContext()
    }
    
    func updateNote(id: String, title: String, desciption: String, date: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
        do {
            guard let notes = try context.fetch(fetchRequest) as? [Note], let note = notes.first(where: {$0.id == id}) else {
                return
            }
            note.title = title
            note.details = desciption
            note.date = date
            
            } catch {
                print(error.localizedDescription)
            }
            
            appDelegate.saveContext()
        }
    }
