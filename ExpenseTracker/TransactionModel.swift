//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 20/5/22.
//

import Foundation
import SwiftUIFontIcon



// MARK: - Transaction
struct Transaction: Codable , Identifiable,Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    let merchant: String
    let amount: Double
    let type: TypeEnum
    let categoryID: Int
    let category: String
    let isPending, isTransfer, isExpense, isEdited: Bool

    enum CodingKeys: String, CodingKey {
        case id, date, institution, account, merchant, amount, type
        case categoryID = "categoryId"
        case category, isPending, isTransfer, isExpense, isEdited
    }
    
    
        var icon: FontAwesomeCode {
            if let category = Category.all.first(where: {$0.id == categoryID}) {
                return category.icon
            }
            return .question
        }
    
        var dateParsed: Date {
            date.dateParsed()
        }
    
        var signedAmount: Double {
            return type.rawValue == TransactionType.credit.rawValue ? amount : -amount
        }
    
        var month: String {
            dateParsed.formatted(.dateTime.year().month(.wide))
        }
}

enum TypeEnum: String, Codable {
    case credit = "credit"
    case debit = "debit"
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}



