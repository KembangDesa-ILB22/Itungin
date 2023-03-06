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
    
    func saveTransaction(amount: Double, category: String, recurrence: Bool, notes: String, transaction_date: Date){
        
        
        let realm = try! Realm()
        // Prepare to handle exceptions.
        let transaction = TransactionEntity()
        transaction._id = UUID().uuidString
        transaction.amount = amount
        transaction.category = category
        transaction.recurrence = recurrence
        transaction.notes = notes
        transaction.transaction_date = transaction_date
        
        do {
            // Open a thread-safe transaction.
            try realm.write {
                realm.add(transaction)
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func readTransaction() -> [TransactionEntity]{
        let realm = try! Realm()
        
        let datatransaction = realm.objects(TransactionEntity.self)
        
        return datatransaction.map { $0 }
    }
}

