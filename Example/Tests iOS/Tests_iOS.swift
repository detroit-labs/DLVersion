//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Vincent Frascello on 2/23/22.
//

import XCTest
@testable import DLVersion

class Tests_iOS: XCTestCase {
    
    func testLocalVersion() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        XCTAssert(version == DLVersion.localVersion().string)
    }
    
    func testVersionFromString() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let testVersions = ["1", "1.2.3", "1.2.3.4", "2.1", "0", "0.0.0"]
        
        for string in testVersions {
            let testVersion = DLVersion.version(string: string)
            XCTAssert(testVersion.string == string)
        }
    }
    
    func testInvalidStrings() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let testCases: [(String, String)] = [("-1....23", "1.23"), ("abc", "0.0.0"), ("$1230", "1230"), ("_123_", "123")]
        
        for testCase in testCases {
            XCTAssert(DLVersion.version(string: testCase.0).string == testCase.1)
        }
    }
    
    func testNewerThan() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let testCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in testCases {
            let olderVersion = DLVersion.version(string: testCase.0)
            let newerVersion = DLVersion.version(string: testCase.1)
            
            XCTAssertTrue(olderVersion.isNewerThan(version: newerVersion))
        }
    }
    
    func testOlderThan() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let testCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in testCases {
            let olderVersion = DLVersion.version(string: testCase.1)
            let newerVersion = DLVersion.version(string: testCase.0)
            
            XCTAssertTrue(olderVersion.isOlderThan(version: newerVersion))
        }
    }
    
    func testIsEqualTo() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let failedTestCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in failedTestCases {
            let olderVersion = DLVersion.version(string: testCase.0)
            let newerVersion = DLVersion.version(string: testCase.1)
            
            XCTAssertFalse(olderVersion.isEqualTo(version: newerVersion))
        }
        
        let validTestCases: [(String, String)] = [("1.2.3", "1.2.3"), ("1.2", "1.2"), ("1", "1"), ("0.0.0", "0.0.0")]
        for testCase in validTestCases {
            let olderVersion = DLVersion.version(string: testCase.0)
            let newerVersion = DLVersion.version(string: testCase.1)
            
            XCTAssertTrue(olderVersion.isEqualTo(version: newerVersion))
        }
    }
}
