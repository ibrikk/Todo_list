//
//  ListViewModel.swift
//  Todo_List
//
//  Created by Ibrahim Khalilov on 2022-11-13.
//

import Foundation

class ListViewModel {
    
    var listArray = [List]()
    
    let coreDataHelper = CoreDataHelper()
    
    func fetchData() {
        listArray = coreDataHelper.fetchData() ?? [List]()
    }
    
    func saveData(title: String) {
        coreDataHelper.saveData(title: title)
    }
    
    func deleteData(index: Int) {
        coreDataHelper.deleteData(index: index)
    }
    
}
