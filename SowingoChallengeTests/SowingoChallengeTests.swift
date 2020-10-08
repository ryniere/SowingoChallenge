//
//  SowingoChallengeTests.swift
//  SowingoChallengeTests
//
//  Created by Ryniere dos Santos Silva on 2020-10-07.
//

import XCTest
@testable import SowingoChallenge

class SowingoChallengeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testAPIWorking()
    {
        
        let expectation = self.expectation(description: "API Call")
        
        ProductService.shared.fetchProducts { result in
            
            expectation.fulfill()
            
        } errorHandler: { error in
            XCTFail("Fail")
        }
        
        // We ask the unit test to wait our expectation to finish.
        self.waitForExpectations(timeout: 20)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
