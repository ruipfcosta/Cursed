import Foundation

public struct Size: Equatable {
    public let lines: Int32
    public let columns: Int32
    
    public init(lines: Int32, columns: Int32) {
        self.lines = lines
        self.columns = columns
    }
}
