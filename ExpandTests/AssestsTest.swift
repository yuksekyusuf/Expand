//
//  AssestsTest.swift
//  ExpandTests
//
//  Created by Ahmet Yusuf Yuksek on 3/19/22.
//

import XCTest
@testable import Expand
class AssestsTest: XCTestCase {
    func test_color_exists() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load \(color) from asset catalogue")
        }
    }
    
    func test_JSON_loading() {
        XCTAssertFalse(Award.allAwards.isEmpty == true, "Failed to load awards from JSON file.")
    }

}
