import Foundation
import Cursed

class Printw {
    func run() {
        let message = "Just a string"
        
        Environment.start()
        
        let window = Window.standard
        let size = window.size
        let center = Position(x: Int32((Int(size.columns) - message.count) / 2), y: size.lines / 2)
        
        window.print(message, at: center)
        window.print("This screen has \(size.lines) rows and \(size.columns) columns\n", at: Position(x: 0, y: size.lines - 2))
        window.print("Try resizing your window (if possible) and then run this program again")
        
        Keyboard.readKey()
        Environment.end()
    }
}
