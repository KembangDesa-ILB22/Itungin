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

    func filterByCategory(category: [String]) -> [TransactionEntity] {
        let realm = try! Realm()

        let datatransaction = realm.objects(TransactionEntity.self)

        let dataFiltered = datatransaction.where {
            $0.category.in(category)
        }.sorted(by: \TransactionEntity.amount)

        return dataFiltered.map { $0 }
    }

    func createRangeMonth(now: Date) -> ClosedRange<Date> {
        let endDate = Date()
        
        let calendar = Calendar.current
        let year = calendar.component(.year, from: endDate)
        let month = calendar.component(.month, from: endDate)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = 1
        dateComponents.timeZone = TimeZone(abbreviation: "IDN")
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0

        let newCalendar = Calendar(identifier: .gregorian)
        let startDate = newCalendar.date(from: dateComponents) ?? Date()
        
        return startDate...endDate
    }
    
    func sumFilterByCategory(category: [String], now: Date) -> Double {
        let realm = try! Realm()

        let datatransaction = realm.objects(TransactionEntity.self)

        let keyPath: KeyPath<TransactionEntity, Double> = \TransactionEntity.amount

        let dataFiltered: Double = datatransaction.where {
            $0.transaction_date.contains(createRangeMonth(now: now)) &&
            $0.category.in(category)
        }.sum(of:keyPath)
    
        return dataFiltered
    }
    
    func filterBySearch(query: String) -> [TransactionEntity] {
        let realm = try! Realm()
        
        let datatransaction = realm.objects(TransactionEntity.self)
        let dataFilter = datatransaction.where {
            ($0.notes .like("*\(query)*") || $0.category .like("*\(query)*") )
        }
        
        return dataFilter.map { $0 }
    }
}

