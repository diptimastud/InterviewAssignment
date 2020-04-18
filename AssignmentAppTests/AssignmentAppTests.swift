//
//  AssignmentAppTests.swift
//  AssignmentAppTests
//
//  Created by Dipti Mastud on 18/04/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import XCTest

@testable import AssignmentApp

class AssignmentAppTests: XCTestCase {

    var listViewModel = ListViewModel()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCoutryDetails() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let expectation = XCTestExpectation(description: "Countries details found")
        let titleExpectation = XCTestExpectation(description: "Title found")

        listViewModel.getCountryDetails { (countryDetails, error) in
            if error != nil {
                XCTFail()
            } else if countryDetails != nil {
                if countryDetails?.title != nil {
                    titleExpectation.fulfill()
                } else {
                     XCTFail()
                }
                let detailsCount = countryDetails?.rows?.count ?? 0
                if detailsCount > 0 {
                    expectation.fulfill()
                } else {
                    XCTFail()
                }
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
