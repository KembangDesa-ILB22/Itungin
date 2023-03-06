//
//  DatabaseManager.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 06/03/23.
//

import Foundation
import RealmSwift


class DatabaseManager {
    static let shared = DatabaseManager()
    
    func saveTransaction(){
        let realm = try! Realm()
        // Prepare to handle exceptions.
        let transaction = TransactionEntity()
        transaction._id = UUID().uuidString
        transaction.amount = 10000
        transaction.category = "Belanja"
        transaction.recurrence = true
        transaction.notes = "Ini test save data pake realm"
        transaction.transaction_date = Date()
        
        do {
            // Open a thread-safe transaction.
            try realm.write {
                realm.add(transaction)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func readTransaction(){
        let realm = try! Realm()
        
        let datatransaction = realm.objects(TransactionEntity.self)
        
        print(datatransaction)
    }
}

