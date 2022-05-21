//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 21/5/22.
//

import SwiftUI

struct RecentTransactionList: View {
    var body: some View {
        VStack {
            HStack {
                //MARK: Header Title
                Text("Recent Transaction")
                    .bold()
                
                Spacer()
                
                //MARK: Header Link
                NavigationLink {
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionList()
    }
}
