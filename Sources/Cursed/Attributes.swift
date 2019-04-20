import Foundation

public struct Attributes: OptionSet {   
    public let rawValue: Int32

    public init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
    public static let normal = Attributes(rawValue: 0)
    public static let attributes = Attributes(rawValue: ncursesBits(mask: ~0, shift: 0))
    public static let charText = Attributes(rawValue: ncursesBits(mask: 1, shift: 0) - 1)
    public static let color = Attributes(rawValue: ncursesBits(mask: (1 << 8) - 1, shift: 0))
    public static let standout = Attributes(rawValue: ncursesBits(mask: 1, shift: 8))
    public static let underline = Attributes(rawValue: ncursesBits(mask: 1, shift: 9))
    public static let reverse = Attributes(rawValue: ncursesBits(mask: 1, shift: 10))
    public static let blink = Attributes(rawValue: ncursesBits(mask: 1, shift: 11))
    public static let dim = Attributes(rawValue: ncursesBits(mask: 1, shift: 12))
    public static let bold = Attributes(rawValue: ncursesBits(mask: 1, shift: 13))
    public static let altCharSet = Attributes(rawValue: ncursesBits(mask: 1, shift: 14))
    public static let invis = Attributes(rawValue: ncursesBits(mask: 1, shift: 15))
    public static let protect = Attributes(rawValue: ncursesBits(mask: 1, shift: 16))
    public static let horizontal = Attributes(rawValue: ncursesBits(mask: 1, shift: 17))
    public static let left = Attributes(rawValue: ncursesBits(mask: 1, shift: 18))
    public static let low = Attributes(rawValue: ncursesBits(mask: 1, shift: 19))
    public static let right = Attributes(rawValue: ncursesBits(mask: 1, shift: 20))
    public static let top = Attributes(rawValue: ncursesBits(mask: 1, shift: 21))
    public static let vertical = Attributes(rawValue: ncursesBits(mask: 1, shift: 22))
    
    private static func ncursesBits(mask: Int32, shift: Int) -> Int32 {
        return mask << (8 + shift)
    }
}
