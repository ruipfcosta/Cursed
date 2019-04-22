import Foundation
import Cursed

class KeyCode {
    func run() {
        Environment.start()
        
        let key = Keyboard.readKey()
        
        let window = Window.standard
        window.print("The key pressed is \(key.code)")
        
        Keyboard.readKey()
        Environment.end()
    }
}
