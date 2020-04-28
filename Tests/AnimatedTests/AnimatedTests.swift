import XCTest
@testable import Animated

final class AnimatedTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Animated().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
