//
//  SearchPhotosTests.swift
//  Censio Challenge SwiftTests
//
//  Created by Cordero Hernandez on 5/16/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import XCTest
@testable import Censio_Challenge_Swift

class SearchPhotosTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchForPhotos() {
        
        let query = "dogs"
        let promise = expectation(description: "Callback will be called")
        
        let testCallback: (SearchPhotosModel?) -> Void = { photos in
            
            if photos != nil {
                promise.fulfill()
            }
        }
        
        SearchPhotos.searchForPhotos(with: query, callback: testCallback)
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}
