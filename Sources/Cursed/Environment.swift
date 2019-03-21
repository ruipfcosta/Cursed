import Foundation
import Cncurses

public typealias ColorPair = (foreground: Color, background: Color)

public struct Environment {
       
    public static func initialize() {
        initscr()
        start_color()
        cbreak()
        noecho()
        keypad(stdscr, true)
    }
    
    public static func deinitialize() {
        endwin()
    }
    
    public static var lines: Int32 {
        return LINES
    }
    
    public static var columns: Int32 {
        return COLS
    }
    
    public static var colors: Int32 {
        return COLORS
    }
    
    public static func setColorPairs(_ pairs: [Int16 : ColorPair]) {
        // Index 0 cannot be used... throw exception?
        pairs.forEach { (index: Int16, pair: ColorPair) in
            init_pair(index, pair.foreground.rawValue, pair.background.rawValue)
        }
    }
}
