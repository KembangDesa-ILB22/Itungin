//
//  TransactionEntity.swift
//  Itungin
//
//  Created by Rivaldo Fernandes on 06/03/23.
//

import Foundation
import RealmSwift

class TransactionEntity: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var category: String = ""
    @Persisted var amount: Double = 0
    @Persisted var transaction_date: Date = Date()
    @Persisted var notes: String = ""
    @Persisted var recurrence: Bool = false
}
