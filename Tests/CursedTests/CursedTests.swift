import XCTest
@testable import Cursed

final class CursedTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Cursed().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
