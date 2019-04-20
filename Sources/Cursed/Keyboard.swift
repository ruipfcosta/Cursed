import Foundation
import Cncurses

public struct Keyboard {
    public static func readKey() -> Key? {
        let code = getch()
        return Key(code: code)
    }
}

public struct Key {
    let value: Character
    
    init?(code: Int32) {
        guard let scalar = UnicodeScalar(Int(code)) else {
            return nil
        }
        
        self.value = Character(scalar)
    }
}
