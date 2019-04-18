import Foundation
import Cncurses

public class Mouse {
    public static func readEvent() -> MouseEvent? {
        mousemask(0, .none)
        
        let event = UnsafeMutablePointer<MEVENT>.allocate(capacity: 1)
        let key = getch()
        
        guard key == KEY_MOUSE, getmouse(event) == OK else {
            return .none
        }
        
        return MouseEvent(id: event.pointee.id, x: event.pointee.x, y: event.pointee.y, z: event.pointee.z, button: .button1Clicked)
    }
}

public struct MouseEvent {
    public let id: Int16
    public let x, y, z: Int32
    public let button: MouseButton
}

public enum MouseButton {
    case button1Down
    case button1Up
    case button1Clicked
    case button1DoubleClicked
    case button1TripleClicked
    case button2Down
    case button2Up
    case button2Clicked
    case button2DoubleClicked
    case button2TripleClicked
    case button3Down
    case button3Up
    case button3Clicked
    case button3DoubleClicked
    case button3TripleClicked
    case button4Down
    case button4Up
    case button4Clicked
    case button4DoubleClicked
    case button4TripleClicked
    case shiftDownOnStateChange
    case ctrlDownOnStateChange
    case altDownOnStateChange
}
