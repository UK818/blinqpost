//
//  blinqpostTests.swift
//  blinqpostTests
//
//  Created by mac on 26/05/2022.
//

import XCTest
@testable import blinqpost

//class MockFirebaseService: FirebaseService {
//	var getMockData: [Post]?
//	func getPosts(completion: @escaping ([Post]) -> Void) {
//		if let result = getMockData {
//			completion(result)
//		}
//	}
//}

class blinqpostTests: XCTestCase {
	
	private var videoViewModel: VideoViewModel!
//	private var firebaseService: MockFirebaseService!

    override func setUpWithError() throws {
//		firebaseService = MockFirebaseService()
		videoViewModel = VideoViewModel()
		try super.setUpWithError()
    }

    override func tearDownWithError() throws {
		videoViewModel = nil
//		firebaseService = nil
		try super.tearDownWithError()
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

}
