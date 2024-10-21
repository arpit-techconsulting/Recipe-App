//
//  RecipeAppTests.swift
//  RecipeAppTests
//
//  Created by Arpit Mallick on 10/18/24.
//

import XCTest
@testable import RecipeApp

final class RecipeAppTests: XCTestCase {
    var sut: HomeViewModel? // Subject under testing

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        sut = nil
        
    }

    func testGetRecipes_isSuccess() async {
        // Given
        sut = HomeViewModel(networkManager: MockApiCall(fileName: "MockResponse"))
        // When
        await sut?.getAllRecipes()
        // Then
        XCTAssertEqual(sut?.allRecipes.count, 50)
    }

}
