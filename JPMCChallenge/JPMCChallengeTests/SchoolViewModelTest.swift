//
//  SchoolViewModelTest.swift
//  JPMCChallengeTests
//
//  Created by Edward Duclervil on 9/8/23.
//

import XCTest
@testable import JPMCChallenge

final class SchoolViewModelTest: XCTestCase {
    var schoolViewModel: SchoolViewModel!

    override func setUpWithError() throws {
        schoolViewModel = SchoolViewModel(networkManager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        schoolViewModel = nil
    }

    func testAPICallForSuccessfulCall() throws {
        schoolViewModel.getSchoolDataFromAPI(urlString: "SchoolList")
        
        let expectation = XCTestExpectation(description: "Fetching School List")
        let waitDuration = 3.0
        
        DispatchQueue.main.async {
            XCTAssertNotNil(self.schoolViewModel)
            XCTAssertEqual(self.schoolViewModel.schoolList.count, 7)
            XCTAssertNil(self.schoolViewModel.networkBasedErrors)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testAPICallForFailedCall() throws {
        schoolViewModel.getSchoolDataFromAPI(urlString: "s")
        
        let expectation = XCTestExpectation(description: "Fetching School List")
        let waitDuration = 3.0
        
        DispatchQueue.main.async {
            XCTAssertNotNil(self.schoolViewModel)
            XCTAssertEqual(self.schoolViewModel.schoolList.count, 0)
            XCTAssertNotNil(self.schoolViewModel.networkBasedErrors)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }
    
    func testAPICallForFiltering() throws {
        schoolViewModel.getSchoolDataFromAPI(urlString: "SchoolList")
        
        let expectation = XCTestExpectation(description: "Fetching School List")
        let waitDuration = 3.0
        
        DispatchQueue.main.async {
            XCTAssertNotNil(self.schoolViewModel)
            XCTAssertEqual(self.schoolViewModel.schoolList.count, 7)
            self.schoolViewModel.filterSchoolList(searchText: "CLINTON")
            XCTAssertEqual(self.schoolViewModel.filteredSchoolList.count, 1)
            XCTAssertNil(self.schoolViewModel.networkBasedErrors)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: waitDuration)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
