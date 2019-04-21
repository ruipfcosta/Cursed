import Foundation
import Cncurses

public class Keyboard {
    
    @discardableResult
    public static func readKey() -> Key {
        let code = getch()
        return Key(code: code)
    }
}

public struct Key {
    public static let yes: Int32 = 0o400
    public static let min: Int32 = 0o401
    public static let `break`: Int32 = 0o401
    public static let softReset: Int32 = 0o530
    public static let reset: Int32 = 0o531
    public static let down: Int32 = 0o402
    public static let up: Int32 = 0o403
    public static let left: Int32 = 0o404
    public static let right: Int32 = 0o405
    public static let home: Int32 = 0o406
    public static let backspace: Int32 = 0o407
    public static let f0: Int32 = 0o410
    public static let f1: Int32 = Key.f0 + 1
    public static let f2: Int32 = Key.f0 + 2
    public static let f3: Int32 = Key.f0 + 3
    public static let f4: Int32 = Key.f0 + 4
    public static let f5: Int32 = Key.f0 + 5
    public static let f6: Int32 = Key.f0 + 6
    public static let f7: Int32 = Key.f0 + 7
    public static let f8: Int32 = Key.f0 + 8
    public static let f9: Int32 = Key.f0 + 9
    public static let f10: Int32 = Key.f0 + 10
    public static let f11: Int32 = Key.f0 + 11
    public static let f12: Int32 = Key.f0 + 12
    public static let deleteLine: Int32 = 0o510
    public static let insertLine: Int32 = 0o511
    public static let deleteCharacter: Int32 = 0o512
    public static let insertCharacter: Int32 = 0o513
    public static let eic: Int32 = 0o514
    public static let clear: Int32 = 0o515
    public static let eos: Int32 = 0o516
    public static let eol: Int32 = 0o517
    public static let scrollForward: Int32 = 0o520
    public static let scrollBackward: Int32 = 0o521
    public static let nextPage: Int32 = 0o522
    public static let previousPage: Int32 = 0o523
    public static let setTab: Int32 = 0o524
    public static let clearTab: Int32 = 0o525
    public static let clearAllTabs: Int32 = 0o526
    public static let enter: Int32 = 0o527
    public static let print: Int32 = 0o532
    public static let homeDown: Int32 = 0o533
    public static let upperLeft: Int32 = 0o534
    public static let upperRight: Int32 = 0o535
    public static let center: Int32 = 0o536
    public static let lowerLeft: Int32 = 0o537
    public static let lowerRight: Int32 = 0o540
    public static let backTab: Int32 = 0o541
    public static let begin: Int32 = 0o542
    public static let cancel: Int32 = 0o543
    public static let close: Int32 = 0o544
    public static let command: Int32 = 0o545
    public static let copy: Int32 = 0o546
    public static let create: Int32 = 0o547
    public static let end: Int32 = 0o550
    public static let exit: Int32 = 0o551
    public static let find: Int32 = 0o552
    public static let help: Int32 = 0o553
    public static let mark: Int32 = 0o554
    public static let message: Int32 = 0o555
    public static let move: Int32 = 0o556
    public static let next: Int32 = 0o557
    public static let open: Int32 = 0o560
    public static let options: Int32 = 0o561
    public static let previous: Int32 = 0o562
    public static let redo: Int32 = 0o563
    public static let reference: Int32 = 0o564
    public static let refresh: Int32 = 0o565
    public static let replace: Int32 = 0o566
    public static let restart: Int32 = 0o567
    public static let resume: Int32 = 0o570
    public static let save: Int32 = 0o571
    public static let shiftedBegin: Int32 = 0o572
    public static let shiftedCancel: Int32 = 0o573
    public static let shiftedCommand: Int32 = 0o574
    public static let shiftedCopy: Int32 = 0o575
    public static let shiftedCreate: Int32 = 0o576
    public static let shiftedDeleteCharacter: Int32 = 0o577
    public static let shiftedDeleteLine: Int32 = 0o600
    public static let select: Int32 = 0o601
    public static let shiftedEnd: Int32 = 0o602
    public static let shiftedEol: Int32 = 0o603
    public static let shiftedExit: Int32 = 0o604
    public static let shiftedFind: Int32 = 0o605
    public static let shiftedHelp: Int32 = 0o606
    public static let shiftedHome: Int32 = 0o607
    public static let shiftedInsertCharacter: Int32 = 0o610
    public static let shiftedLeft: Int32 = 0o611
    public static let shiftedMessage: Int32 = 0o612
    public static let shiftedMove: Int32 = 0o613
    public static let shiftedNext: Int32 = 0o614
    public static let shiftedOptions: Int32 = 0o615
    public static let shiftedPrevious: Int32 = 0o616
    public static let shiftedPrint: Int32 = 0o617
    public static let shiftedRedo: Int32 = 0o620
    public static let shiftedReplace: Int32 = 0o621
    public static let shiftedRight: Int32 = 0o622
    public static let shiftedResume: Int32 = 0o623
    public static let shiftedSave: Int32 = 0o624
    public static let shiftedSuspend: Int32 = 0o625
    public static let shiftedUndo: Int32 = 0o626
    public static let suspend: Int32 = 0o627
    public static let undo: Int32 = 0o630
    public static let mouse: Int32 = 0o631
    public static let terminalResize: Int32 = 0o632
    public static let event: Int32 = 0o633
    public static let max: Int32 = 0777
    
    public let code: Int32
    
    public func character() -> Character? {
        guard let scalar = UnicodeScalar(Int(code)) else {
            return .none
        }
        
        return Character(scalar)
    }
}
