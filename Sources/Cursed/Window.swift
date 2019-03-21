import Foundation
import Cncurses

public class Window {
    
    private let window: OpaquePointer!
    
    init(_ window: OpaquePointer!) {
        self.window = window
    }
    
    public static var standard: Window {
        return Window(stdscr)
    }
    
    public static func new(size: Size, at position: Position) -> Window {
        let window = newwin(size.lines, size.columns, position.y, position.x)
        return Window(window)
    }
    
    public func refresh() {
        wrefresh(window)
    }
    
    public func clear() {
        wclear(window)
    }
    
    public func move(to position: Position) {
//        Calling mvwin moves the window so that the upper left-hand corner is at
//        position  (x,  y).   If  the  move would cause the window to be off the
//        screen, it is an error and the window is not moved.  Moving  subwindows
//        is allowed, but should be avoided.
        mvwin(window, position.y, position.x)
    }
    
    public func createSubWindow(size: Size, at position: Position) -> Window {
//         Calling derwin is the same as calling subwin, except that  begin_y  and
//         begin_x  are  relative to the origin of the window orig rather than the
//         screen
        
//        subwin
//        returns an error if the parent window pointer is null, or  if  any
//        of  its  ordinates  or dimensions is negative, or if the resulting
//        window does not fit inside the parent window.
        
//        derwin
//        returns an error if the parent window pointer is null, or  if  any
//        of  its  ordinates  or dimensions is negative, or if the resulting
//        window does not fit inside the parent window.

        let subWindow = subwin(window, size.lines, size.columns, position.y, position.x)
        return Window(subWindow)
    }
    
    public func duplicate() -> Window {
        let duplicateWindow = dupwin(window)
        return Window(duplicateWindow)
    }
    
    // Print functions
    public func print(text: String, at position: Position, refresh: Bool = true) {
        //init_color(1001, 0, <#T##Int16#>, <#T##Int16#>)
        init_pair(1, Int16(truncating: NSNumber(value: 3)), Int16(truncating: NSNumber(value: 10)))
        
        attron(COLOR_PAIR(1));
        mvwaddstr(window, position.y, position.x, text)
        
        if refresh {
            wrefresh(window)
        }
    }
}
