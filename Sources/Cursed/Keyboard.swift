import Foundation
import Cncurses

public class Keyboard {
    public static func readKey() -> Key {
        let key = getch()
        return Key(rawValue: key)
    }
}

public enum Key {
    case down
    case unknown(value: Int32)
    
    init(rawValue: Int32) {
        switch rawValue {
        case KEY_DOWN: self = .down
        default: self = .unknown(value: rawValue)
        }
    }
    
    public var rawValue: Int32 {
        switch self {
        case .down: return KEY_DOWN
        case .unknown(let value): return value
        }
    }
}
