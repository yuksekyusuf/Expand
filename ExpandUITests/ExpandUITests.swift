//
//  ExpandUITests.swift
//  ExpandUITests
//
//  Created by Ahmet Yusuf Yuksek on 3/18/22.
//

import CoreData
import XCTest
@testable import Expand

class BaseTestCase: XCTestCase {
    var dataController: DataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = DataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }
}
