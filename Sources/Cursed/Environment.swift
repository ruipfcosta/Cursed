import Foundation
import Cncurses

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
}
