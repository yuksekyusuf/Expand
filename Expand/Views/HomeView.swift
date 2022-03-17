//
//  HomeView.swift
//  SwiftUIPortfolio
//
//  Created by Ahmet Yusuf Yuksek on 1/3/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    static let tag: String? = "Home"
    @EnvironmentObject var dataController: DataController
    
    @FetchRequest(entity: Project.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Project.title, ascending: true)], predicate: NSPredicate(format: "closed = false"))
    var projects: FetchedResults<Project>

    let items: FetchRequest<Item>
    // Construct a fetch request to show the 10 highest-priority, incomplete items from open projects.
    init() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let closedPredicate = NSPredicate(format: "completed = false ")
        let openPredicate = NSPredicate(format: "project.closed = false")
        let compoundPredicate = NSCompoundPredicate(type: .and, subpredicates: [closedPredicate, openPredicate])
        request.predicate = compoundPredicate
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Item.priority, ascending: false)
        ]
        request.fetchLimit = 10
        items = FetchRequest(fetchRequest: request)
    }
    
    var projectRows: [GridItem] {
        [GridItem(.fixed(100))]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: projectRows) {
                            ForEach(projects, content: ProjectSummaryView.init)
                        }
                        .padding([.horizontal, .top])
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    VStack(alignment: .leading) {
                        ItemListView(title: "Up next", items: items.wrappedValue.prefix(3))
                        ItemListView(title: "More to explore", items: items.wrappedValue.dropFirst(3))
                    }
                    .padding(.horizontal)
                }
                
            }
            .background(Color.systemGroupedBackground.ignoresSafeArea())
            .navigationTitle("Home")
            .toolbar {
                Button("Add Data") {
                    dataController.deleteAll()
                    try? dataController.createSampleData()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
