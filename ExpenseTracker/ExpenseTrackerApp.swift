//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 19/5/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
