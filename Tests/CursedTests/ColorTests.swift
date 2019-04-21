import XCTest
@testable import Cursed

final class ColorTests: XCTestCase {
    
    func testCreatingDuplicatedPairs() {
        let pair1 = ColorPair(foregroundColor: .red, backgroundColor: .blue)
        let pair2 = ColorPair(foregroundColor: .red, backgroundColor: .blue) // same as pair1
        
        let index1 = Color.createPair(pair1)
        let index2 = Color.createPair(pair2)
        
        XCTAssertEqual(index1, index2)
    }
    
    func testCreatingDifferentPairs() {
        let pair1 = ColorPair(foregroundColor: .red, backgroundColor: .blue)
        let pair2 = ColorPair(foregroundColor: .white, backgroundColor: .green)
        
        let index1 = Color.createPair(pair1)
        let index2 = Color.createPair(pair2)
        
        XCTAssertNotEqual(index1, index2)
    }
    
    static var allTests = [
        ("testCreatingDuplicatedPairs", testCreatingDuplicatedPairs),
        ("testCreatingDifferentPairs", testCreatingDifferentPairs),
    ]
}
