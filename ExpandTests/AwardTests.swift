//
//  AwardTests.swift
//  ExpandTests
//
//  Created by Ahmet Yusuf Yuksek on 3/21/22.
//

import XCTest
@testable import Expand

class AwardTests: BaseTestCase {

    let awards = Award.allAwards
    
    func test_awardId_matches_name() {
        for award in awards {
            XCTAssertEqual(award.id, award.name)
        }
    }
    
    func test_noAwards() {
        for award in awards {
            XCTAssertFalse(dataController.hasEarned(award: award), "New users should have no earned awards")
        }
    }
    
    func test_item_awards() {
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]
        for (count, value) in values.enumerated() {
            var items = [Item]()
            for _ in 0..<value {
                let item = Item(context: managedObjectContext)
                items.append(item)
            }
            
            let matches = awards.filter { award in
                award.criterion == "items" && dataController.hasEarned(award: award)
                
            }
            
            XCTAssertEqual(matches.count, count + 1, "Adding \(value) items should unlock \(count + 1) awards.")
            
            for item in items {
                dataController.delete(item)
            }
        }
    }
    
    func test_completed_awards() throws {
        let values = [1, 10, 20, 50, 100, 250, 500, 1000]

            for (count, value) in values.enumerated() {
                var items = [Item]()

                for _ in 0..<value {
                    let item = Item(context: managedObjectContext)
                    item.completed = true
                    items.append(item)
                }

                let matches = awards.filter { award in
                    award.criterion == "complete" && dataController.hasEarned(award: award)
                }

                XCTAssertEqual(matches.count, count + 1, "Completing \(value) items should unlock \(count + 1) awards.")

                for item in items {
                    dataController.delete(item)
                }
            }
    }

}
