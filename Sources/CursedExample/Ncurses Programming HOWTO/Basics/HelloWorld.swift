import Foundation
import Cursed

class HelloWorld {
    func run() {
        Environment.start()
        let window = Window.standard
        window.print("Hello World!", at: .zero)
        Keyboard.readKey()
        Environment.end()
    }
}
