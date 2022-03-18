//
//  AssetsTest.swift
//  ExpandUITests
//
//  Created by Ahmet Yusuf Yuksek on 3/18/22.
//
import XCTest
@testable import Expand

class AssetTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from asset catalog.")
        }
    }
    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
