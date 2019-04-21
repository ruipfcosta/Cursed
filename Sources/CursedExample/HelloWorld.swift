import Foundation
import Cursed

class HelloWorld {
    static func run() {
        Environment.start()
        
        let window = Window.standard
        window.print(text: "Hello World!", at: .zero)
        
        Environment.end()
    }
}
