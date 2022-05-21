//
//  TransactionModel.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 20/5/22.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
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

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategory: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto and Transport", icon: .car_alt)
    static let billAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainmaent", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "fees and Charge", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food and Dining", icon: .hamburger)
    static let home = Category(id: 6, name: "home", icon: .home)
    static let income = Category(id: 7, name: "income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .expand_alt)
    
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategory: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategory: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile_alt, mainCategory: 2)
    static let movieAndDVDs = Category(id: 301, name: "Movies and DVDs", icon: .film, mainCategory: 3)
    static let bankFee = Category(id: 401, name: "Bank fee", icon: .hand_holding_usd, mainCategory: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .hand_holding_usd, mainCategory: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategory: 5)
    static let rent = Category(id: 601, name: "Resturants", icon: .utensils, mainCategory: 5)
    static let resturants = Category(id: 601, name: "Rent", icon: .house_user, mainCategory: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategory: 6)
    static let paycheque = Category(id: 701, name: "paycheque", icon: .dollar_sign, mainCategory: 7)
    static let software = Category(id: 801, name: "Software", icon: .icons, mainCategory: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit card Payment", icon: .exchange_alt, mainCategory: 9)
    
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
            .billAndUtilities,
        .entertainment,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
        
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .movieAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .resturants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subCategories
}






























