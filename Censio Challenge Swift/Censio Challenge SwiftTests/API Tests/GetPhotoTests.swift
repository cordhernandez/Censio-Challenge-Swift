//
//  GetPhotoTest.swift
//  Censio Challenge SwiftTests
//
//  Created by Cordero Hernandez on 5/22/18.
//  Copyright © 2018 Cordero Hernandez. All rights reserved.
//

import XCTest
@testable import Censio_Challenge_Swift

class GetPhotoTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetPhoto() {
        
        let id = "Sr7ez2HePQo"
        let promise = expectation(description: "Callback will be called")
        
        let testCallback: (GetPhotoModel?) -> Void = { photo in
            
            if photo != nil {
                promise.fulfill()
            }
        }
        
        GetPhoto.getPhoto(with: id, callback: testCallback)
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
}
