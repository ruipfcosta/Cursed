import Foundation
import Cursed

class WinBorder {
    
    func run() {
        Environment.start()
        
        let window = Window.standard
        let height: Int32 = 3
        let width: Int32 = 10
        var startY: Int32 = (Environment.lines - height) / 2
        var startX: Int32 = (Environment.columns - width) / 2
        
        window.print("Press F1 to exit")
        
        // Create smaller window
        let windowSize = Size(lines: width, columns: height)
        var myWindow = createNewWindow(size: windowSize, startX: startX, startY: startY)
        
        var key = Keyboard.readKey()
        
        while key.code != Key.f1 {
            switch key.code {
            case Key.left:
                startX -= 1
                myWindow.setBorder(character: " ")
                myWindow.destroy()
                myWindow = createNewWindow(size: windowSize, startX: startX, startY: startY)
            case Key.right:
                startX += 1
                myWindow.setBorder(character: " ")
                myWindow.destroy()
                myWindow = createNewWindow(size: windowSize, startX: startX, startY: startY)
            case Key.up:
                startY -= 1
                myWindow.setBorder(character: " ")
                myWindow.destroy()
                myWindow = createNewWindow(size: windowSize, startX: startX, startY: startY)
            case Key.down:
                startY += 1
                myWindow.setBorder(character: " ")
                myWindow.destroy()
                myWindow = createNewWindow(size: windowSize, startX: startX, startY: startY)
            default:
                break
            }
            
            key = Keyboard.readKey()
        }
        
        Environment.end()
    }
    
    func createNewWindow(size: Size, startX: Int32, startY: Int32) -> Window {
        let window = Window(size: size, position: Position(x: startX, y: startY))
        window.box()
        return window
    }
}
