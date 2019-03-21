import Foundation
import Cncurses

public struct Environment {
    
    public static func initialize() {
        initscr()
        start_color()
        
        // Define available color pairs
//        init_pair(1, Int16(truncating: NSNumber(value: COLOR_RED)), Int16(truncating: NSNumber(value: COLOR_BLUE)))
        
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
}
