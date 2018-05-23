//
//  GetRandomPhotoTests.swift
//  Censio Challenge SwiftTests
//
//  Created by Cordero Hernandez on 5/22/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import XCTest
@testable import Censio_Challenge_Swift

class GetRandomPhotoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetRandomPhoto() {
        
        let query = "Trees"
        let promise = expectation(description: "Callback will be called")
        
        let testCallback: (GetRandomPhotoModel?) -> Void = { randomPhoto in
            
            if randomPhoto != nil {
                promise.fulfill()
            }
        }
        
        GetRandomPhoto.getRandomPhoto(with: query, callback: testCallback)
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
}
