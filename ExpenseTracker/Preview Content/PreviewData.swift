//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 20/5/22.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "01/24/2022", institution: "Desjardins", account: "Visa Desjardins", merchant: "Apple", amount: 11.49, type: TransactionType(rawValue: "debit") ?? TransactionType.debit, categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: true, isEdited: false)


var transationListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
