import Foundation

public struct Position: Equatable {
    public let x: Int32
    public let y: Int32
    
    public static var zero: Position {
        return Position(x: 0, y: 0)
    }
    
    public init(x: Int32, y: Int32) {
        self.x = x
        self.y = y
    }
}
