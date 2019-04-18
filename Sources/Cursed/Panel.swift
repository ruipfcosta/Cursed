import Foundation
import Cncurses

public class Panel: Window {
    let panel: UnsafeMutablePointer<PANEL>!
    
    public init(size: Size, position: Position) {
        let window = newwin(size.lines, size.columns, position.y, position.x)
        self.panel = new_panel(window)
        
        super.init(window)
    }
    
    public override func refresh() {
        super.refresh()
        update_panels()
        doupdate()
    }
    
    override public func move(to position: Position) {
        move_panel(panel, position.y, position.x)
    }
    
    public func show() {
        show_panel(panel)
    }
    
    public func hide() {
        hide_panel(panel)
    }
    
}
