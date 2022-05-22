//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 20/5/22.
//

import Foundation
import SwiftUIFontIcon

/*
 {
   "id": 21,
   "date": "02/04/2022",
   "institution": "Desjardins",
   "account": "Visa Desjardins",
   "merchant": "Uber.com",
   "amount": 10.35,
   "type": "debit",
   "categoryId": 102,
   "category": "Taxi",
   "isPending": false,
   "isTransfer": false,
   "isExpense": true,
   "isEdited": false
 },
 */

// MARK: - Transaction
struct Transaction: Codable , Identifiable,Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    let categoryId: Int
    let category: String
    let isPending: Bool
    let isTransfer: Bool
    let isExpense:  Bool
    let isEdited: Bool
    
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: {$0.id == categoryId}) {
            return category.icon
        }
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}


enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}



