import Foundation
import Cursed

Environment.initialize()

let window = Window.standard
window.print(text: "Lines: \(Environment.lines)", at: .zero)
window.print(text: "Columns: \(Environment.columns)", at: Position(x: 0, y: 1))
window.print(text: "COLORS: \(Environment.colors)", at: Position(x: 0, y: 2))

Thread.sleep(forTimeInterval: 3)

Environment.deinitialize()
