import Foundation
import Cursed

class InitFunc {
    func run() {
        Environment.start()
        
        let window = Window.standard
        window.print("Type any character to see it in bold\n")
        
        let key = Keyboard.readKey()
        
        switch key.code {
        case Key.f1:
            window.print("F1 key pressed")
        default:
            let character = key.character() ?? Character("")
            window.print("The key pressed is ")
            window.print("\(character)", attributes: [.bold])
        }
        
        Keyboard.readKey()
        Environment.end()
    }
}
