import Foundation
import Cncurses

public class Window {
    
    let window: OpaquePointer!
    
    public static var standard: Window {
        return Window(stdscr)
    }
    
    init(_ window: OpaquePointer!) {
        self.window = window
    }
    
    public convenience init(size: Size, position: Position) {
        let window = newwin(size.lines, size.columns, position.y, position.x)
        self.init(window)        
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
    
    public func setBackgroundColor(colorPairIndex: Int32 = 0) {
        guard colorPairIndex > 0 else { return }
        
        let colorPair = COLOR_PAIR(colorPairIndex)
        wbkgd(window, UInt32(colorPair))
        wbkgdset(window, UInt32(colorPair))
        refresh()
    }
    
    // Print functions
    public func print(text: String, at position: Position, colorPairIndex: Int32 = 0, refresh: Bool = true) {

        func print(text: String, at position: Position) {
            mvwaddstr(window, position.y, position.x, text)
        }
        
        if colorPairIndex == 0 {
            print(text: text, at: position)
        } else {
            let colorPair = COLOR_PAIR(colorPairIndex)
            attron(colorPair);
            print(text: text, at: position)
            attroff(colorPair)
        }
        
        if refresh {
            wrefresh(window)
        }
    }
}
