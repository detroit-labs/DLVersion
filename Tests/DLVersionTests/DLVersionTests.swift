import XCTest
@testable import DLVersion

final class DLVersionTests: XCTestCase {
    func testLocalVersion() throws {
        let versionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let localVersionString = try DLVersion.localVersion().string
        XCTAssert(versionString == localVersionString)
    }
    
    func testVersionFromString() throws {
        let testVersions = ["1", "1.2.3", "1.2.3.4", "2.1", "0", "0.0.0"]
        
        for string in testVersions {
            let testVersion = try DLVersion.version(string: string)
            XCTAssert(testVersion.string == string)
        }
    }
    
    func testInvalidStrings() throws {
        let testCases: [String] = ["", "abc", "...", "\n", "!", "१.२.३"]
        
        for testCase in testCases {
            XCTAssertThrowsError(try DLVersion.version(string: testCase).string)
        }
    }
    
    func testNewerThan() throws {
        let testCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in testCases {
            let olderVersion = try DLVersion.version(string: testCase.0)
            let newerVersion = try DLVersion.version(string: testCase.1)
            
            XCTAssertTrue(olderVersion.isNewerThanVersion(newerVersion))
        }
    }
    
    func testOlderThan() throws {
        let testCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in testCases {
            let olderVersion = try DLVersion.version(string: testCase.1)
            let newerVersion = try DLVersion.version(string: testCase.0)
            
            XCTAssertTrue(olderVersion.isOlderThanVersion(newerVersion))
        }
    }
    
    func testIsEqualTo() throws {
        let failedTestCases: [(String, String)] = [("1.2.3", "1.2"), ("1.2.3", "1"), ("1.2.3.4", "1.2.3"), ("2", "1.9.9")]
        for testCase in failedTestCases {
            let olderVersion = try DLVersion.version(string: testCase.0)
            let newerVersion = try DLVersion.version(string: testCase.1)
            
            XCTAssertFalse(olderVersion.isEqualToVersion(newerVersion))
        }
        
        let validTestCases: [(String, String)] = [("1.2.3", "1.2.3"), ("1.2", "1.2"), ("1", "1"), ("0.0.0", "0.0.0")]
        for testCase in validTestCases {
            let olderVersion = try DLVersion.version(string: testCase.0)
            let newerVersion = try DLVersion.version(string: testCase.1)
            
            XCTAssertTrue(olderVersion.isEqualToVersion(newerVersion))
        }
    }
}
