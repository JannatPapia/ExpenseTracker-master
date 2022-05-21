//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 20/5/22.
//

import Foundation

struct Transaction: Decodable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryId: Int
    let category: String
    let isPanding: Bool
    let isTransfer: Bool
    let isExpense:  Bool
    let isEdited: Bool
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
}


enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
