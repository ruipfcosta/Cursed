import Foundation
import Cursed
import Cncurses // Cncurses should not be imported here

Environment.initialize()
Environment.setColorPairs([
    1: (foreground: Color.red, background: Color.blue),
    2: (foreground: Color.green, background: Color.white),
    3: (foreground: Color.white, background: Color.magenta)])

// Test print on window with colors
let window = Window.standard
window.print(text: "Lines: \(Environment.lines)", at: .zero)
window.print(text: "Columns: \(Environment.columns)", at: Position(x: 0, y: 1))
window.print(text: "Supported colors: \(Environment.colors)", at: Position(x: 0, y: 2))

// Test keyboard
//let key = Keyboard.readKey()
//
//switch key {
//case .down:
//    window.print(text: "Pressed down key", at: Position(x: 0, y: 5))
//case .unknown(let value):
//    window.print(text: "Unknown key pressed: \(value)", at: Position(x: 0, y: 5))
//}

// Test mouse
//window.print(text: "Will read mouse", at: Position(x: 0, y: 7))
//if let event = Mouse.readEvent() {
//    window.print(text: "Mouse event (x, y, z) -> (\(event.x), \(event.y), \(event.z))", at: Position(x: 0, y: 8))
//} else {
//    window.print(text: "No mouse event detected", at: Position(x: 0, y: 9))
//}


//let window2 = Window(size: Size(lines: 10, columns: 10), position: Position(x: 20, y: 3))
//window2.setBackgroundColor(colorPairIndex: 0)
//wbkgd(stdscr, UInt32(PAIR_NUMBER(2)))
//wrefresh(stdscr)
//
//let panel = Panel(size: Size(lines: 10, columns: 10), position: Position(x: 20, y: 3))
//panel.print(text: "Zero", at: .zero)
//panel.refresh()

//let panel = new_panel(window2)
//update_panels()
//doupdate()

// Test menu
let choices = [
    "Choice 1",
    "Choice 2",
    "Choice 3",
    "Choice 4",
]

var items: [UnsafeMutablePointer<ITEM>] = []

for choice in choices {
    let item = new_item(choice, choice)
    items.append(item!)
}




//let menu = new_menu(UnsafeMutablePointer(mutating: items))




Thread.sleep(forTimeInterval: 2)

Environment.deinitialize()
