//
//  ViewModelTest.swift
//  WordDictionaryProjectTests
//
//  Created by User on 20/07/23.
//

import XCTest
@testable import WordDictionaryProject

class ViewModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWordMeaningData() {
        let viewModel = SearchViewModel()
        viewModel.searchText = "Hello"
        // Create an expectation for an asynchronous task.
        let expectation = XCTestExpectation(description: "ViewModel test ApiDataCalling")
        //viewModel.getRequestedWord()
        viewModel.apiService.getWordDetails(with: "Hello") { (wordData, msg) in
            if wordData != nil {
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 30.0)
        //Assert
        XCTAssertNotNil(viewModel.wordData)
        XCTAssertTrue(viewModel.wordData.meanings.count > 0)
        
    }
}
