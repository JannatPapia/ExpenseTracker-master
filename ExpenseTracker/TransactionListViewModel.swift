//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 21/5/22.
//

import Foundation
import Combine
import Collections
//import UIKit

typealias TransactionGroup = OrderedDictionary<String, [Transaction]>
typealias TransactionPrefixSum = [(String, Double)]

final class  TransactionListViewModel:  ObservableObject {
 //   @Published var transactions: Transaction?
    var transactions: [Transaction] = []
    
//    private var cancellables = Set<AnyCancellable>()
    
    init() {
        getTransactions()
    }
//    required init(coder decoder: NSCoder) {
//        super.init(coder: decoder)!
//    }
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    func getTransactions() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
            return
        }
        let url = URL(fileURLWithPath: path)
                do {
            let jsonData = try Data(contentsOf: url)
            transactions = try JSONDecoder().decode([Transaction].self, from: jsonData)
        }
        catch {
            print("Invalid URL")
        }
 //       guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
        //    print("Invalid URL")
   //         return
        }
        
//             URLSession.shared.dataTaskPublisher(for: url)
//            .tryMap{ (data, response) -> Data in
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
//                    dump(response)
//                    throw URLError(.badServerResponse)
//                }
//
//                return data
//
//            }
//            .decode(type: [Transaction].self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
//            .sink { completion in
//                switch completion {
//                case.failure(let error):
//                    print("Error fetching transactions:", error.localizedDescription)
//                case.finished:
//                    print("Finished fetching transactions")
//                }
//            } receiveValue: { [weak self] result in
//                self?.transactions = result
//                dump(self?.transactions)
//            }
//            .store(in: &cancellables)
    

    func groupTransactionsByMonth() -> TransactionGroup {
        guard !transactions.isEmpty else {return [:] }
        
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
    }
    
    func accumulateTransactions() -> TransactionPrefixSum {
        print("accumulateTransactions")
        guard !transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed() // Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInerval", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = TransactionPrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(0) { $0 - $1.signedAmount }
            
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
        }
        return cumulativeSum
    }
}
