//
//  ContentView.swift
//  iExpense
//
//  Created by Jared Tamulynas on 11/10/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    


    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Personal")) {
                    ForEach(expenses.items.filter { $0.type == "Personal"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                        
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                        .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red))
                        .accessibilityElement()
                        .accessibilityLabel("\(item.name), \(item.amount.formatted(.currency(code: "USD")))")
                        .accessibilityHint(item.type)
                    }
                    .onDelete(perform: removeItems)
                }
                
                Section(header: Text("Business")) {
                    ForEach(expenses.items.filter { $0.type == "Business"}) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()
                        
                            Text(item.amount, format: .currency(code: "USD"))
                        }
                        .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red))
                    }
                    .onDelete(perform: removeItems)
                }
            }
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
