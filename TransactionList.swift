//
//  TransactionList.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 21/5/22.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    var body: some View {
        VStack {
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transationListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        
        Group {
            NavigationView {
            TransactionList()
            }
            NavigationView {
            TransactionList()
                    .preferredColorScheme(.dark)
            }
               
        }
        .environmentObject(transactionListVM)
    }
}
