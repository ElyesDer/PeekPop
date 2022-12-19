//
//  PeekPopTests.swift
//  PeekPopTests
//
//  Created by Derouiche Elyes on 18/12/2022.
//

import XCTest
@testable import PeekPop

final class PeekPopTests: XCTestCase {

    let zut: HomeViewModel = .init()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_sort_method() {
        // given
        zut.randomAddRecipe()
        zut.randomAddRecipe()
        
        // test
        if let firstElement = zut.recipes.first {
            let secondElement = zut.recipes[1]
            
            XCTAssert(firstElement.note > secondElement.note, "Note is ordered in descanding order")
            XCTAssert(firstElement.requiredTime < secondElement.requiredTime, "requiredTime is ordered in Ascanding order")
            XCTAssert(firstElement.name < secondElement.name, "Name is ordered in Ascanding order")
        } else {
            assertionFailure("Should have atleast a value")
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
