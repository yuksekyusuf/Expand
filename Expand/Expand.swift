//
//  SwiftUIPortfolioApp.swift
//  SwiftUIPortfolio
//
//  Created by Ahmet Yusuf Yuksek on 1/2/22.
//

import SwiftUI

@main
struct ExpandApp: App {
    
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
