import Foundation
import Cursed

Environment.initialize()
Environment.setColorPairs([
    1: (foreground: Color.red, background: Color.blue),
    2: (foreground: Color.green, background: Color.white),
    3: (foreground: Color.white, background: Color.magenta)])

let window = Window.standard
window.print(text: "Lines: \(Environment.lines)", at: .zero, colorPairIndex: 1)
window.print(text: "Columns: \(Environment.columns)", at: Position(x: 0, y: 1), colorPairIndex: 2)
window.print(text: "COLORS: \(Environment.colors)", at: Position(x: 0, y: 2), colorPairIndex: 3)

Thread.sleep(forTimeInterval: 3)

Environment.deinitialize()
