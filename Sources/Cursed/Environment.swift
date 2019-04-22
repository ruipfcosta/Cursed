import Foundation
import Cncurses

public struct Environment {
       
    public static func start() {
        initscr()
        start_color()
        cbreak()
        noecho()
        keypad(stdscr, true)
    }
    
    public static func end() {
        endwin()
    }
    
    public static func save() {
        def_prog_mode()
    }
    
    public static func restore() {
        reset_prog_mode()
        Window.standard.refresh()
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
