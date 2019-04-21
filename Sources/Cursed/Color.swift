import Foundation

public struct ColorPair: Equatable {
    public let foregroundColor: Color
    public let backgroundColor: Color
    
    public init(foregroundColor: Color, backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }
}

public enum Color: RawRepresentable, Equatable {
    case black
    case red
    case green
    case yellow
    case blue
    case magenta
    case cyan
    case white
    case other(Int16)
    
    public init?(rawValue: Int16) {
        switch rawValue {
        case 0: self = .black
        case 1: self = .red
        case 2: self = .green
        case 3: self = .yellow
        case 4: self = .blue
        case 5: self = .magenta
        case 6: self = .cyan
        case 7: self = .white
        default:
            guard rawValue > 7 && rawValue < Environment.colors else {
                return nil
            }
            self = .other(rawValue)
        }
    }
    
    public var rawValue: Int16 {
        switch self {
        case .black:             return 0
        case .red:               return 1
        case .green:             return 2
        case .yellow:            return 3
        case .blue:              return 4
        case .magenta:           return 5
        case .cyan:              return 6
        case .white:             return 7
        case .other(let value):  return value
        }
    }
    
    // Color pairs
    private static var currentPairIndex: Int16 = 1
    private static var colorPairs: [Int16 : ColorPair] = [:]
    
    @discardableResult
    public static func createPair(_ newPair: ColorPair) -> Int16 {
        if let existingPair = colorPairs.first(where: { $0.value == newPair }) {
            return existingPair.key
        } else {
            let newIndex = currentPairIndex
            colorPairs[newIndex] = newPair
            init_pair(newIndex, newPair.foregroundColor.rawValue, newPair.backgroundColor.rawValue)
            currentPairIndex += 1
            
            return newIndex
        }
    }
}
