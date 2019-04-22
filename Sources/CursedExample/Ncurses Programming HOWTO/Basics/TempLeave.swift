import Foundation
import Cursed

class TempLeave {
    func run() {
        Environment.start()
        
        let window = Window.standard
        window.print("Hello World!\n")
        Keyboard.readKey()
        
        Environment.save()
        Environment.end()
        
        shell("echo", "Back to cooked mode for 3 seconds...")
        Thread.sleep(until: Date().addingTimeInterval(3))
        
        Environment.restore()
        
        window.print("Another String\n")
        Keyboard.readKey()
        Environment.end()
    }
}

@discardableResult
private func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
