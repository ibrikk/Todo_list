//
//  CoreDataHelper.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//

import UIKit

class CoreDataHelper {
    // Initializes intself as a singleton object
    static let shared = CoreDataHelper()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetchData() -> [List]? {
        do {
            return try self.context.fetch(List.fetchRequest())
        } catch {
            print("Error \(error.localizedDescription)")
        }
        
        return nil
    }
    
    func saveData(title: String) {
        let list = List(context: context)
        list.title = title
        do {
            try self.context.save()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
    func deleteData(index: Int) {
        if let dataArray = fetchData() {
            context.delete(dataArray[index])
        }
        do {
            try self.context.save()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
    
}
