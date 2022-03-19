//
//  ProjectTests.swift
//  ExpandTests
//
//  Created by Ahmet Yusuf Yuksek on 3/19/22.
//

import XCTest
import CoreData
@testable import Expand

class ProjectTests: BaseTestCase {

    func test_create_project_and_items() {
        let targetCount = 10
        
        for _ in 0..<targetCount {
            let project = Project(context: managedObjectContext)
            for _ in 0..<targetCount {
                let item = Item(context: managedObjectContext)
                item.project = project
            }
        }
        
        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), targetCount)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), targetCount * targetCount    )
    }
    
    func test_delete_project_cascade_items() throws {
        try dataController.createSampleData()
        let request = NSFetchRequest<Project>(entityName: "Project")
        let projects = try managedObjectContext.fetch(request)
        dataController.delete(projects[0])
        
        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 4)
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 40)
    }

}
