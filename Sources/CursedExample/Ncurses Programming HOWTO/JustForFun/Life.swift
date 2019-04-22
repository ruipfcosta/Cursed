import Foundation
import Cursed

class Life {
    struct State {
        var old: Int
        var new: Int
        
        init(old: Int, new: Int) {
            self.old = old
            self.new = new
        }
    }
    
    typealias Area = [[State]]
    
    lazy var lines = {
        return Int(Environment.lines)
    }()
    
    lazy var columns = {
       return Int(Environment.columns)
    }()
    
    func run() {
        Environment.start()
        timeout(300)
        
        // Initialize workarea
        var workarea: Area = Array(repeating: Array(repeating: State(old: 0, new: 0), count: lines), count: columns)
        
        workarea[39][15].new = 1
        workarea[40][15].new = 1
        workarea[41][15].new = 1
        workarea[39][16].new = 1
        workarea[39][17].new = 1
        workarea[41][16].new = 1
        workarea[41][17].new = 1
        
        workarea = updateState(area: workarea)
        display(area: workarea)
        
        while Keyboard.readKey().code != Key.f1 {
            for (i, line) in workarea.enumerated() {
                for (j, _) in line.enumerated() {
                    workarea = calc(area: workarea, i: i, j: j)
                }
            }
            
            workarea = updateState(area: workarea)
            display(area: workarea)
        }
        
        Environment.end()
    }
    
    func updateState(area: Area) -> Area {
        var updatedArea = area
        
        for (i, line) in area.enumerated() {
            for (j, _) in line.enumerated() {
                updatedArea[i][j].old = updatedArea[i][j].new
            }
        }
        
        return updatedArea
    }
    
    func display(area: Area) {
        Window.standard.clear()
        
        for (i, line) in area.enumerated() {
            for (j, value) in line.enumerated() {
                if value.new == 1 {
                    Window.standard.print("#", at: Position(x: Int32(i), y: Int32(j)))
                }
            }
        }
    }
    
    func calc(area: Area, i: Int, j: Int) -> Area {
        let neighbours =
            area[(i - 1 + columns) % columns][j].old +
            area[(i - 1 + columns) % columns][(j - 1 + lines) % lines].old +
            area[(i - 1 + columns) % columns][(j + 1) % lines].old +
            area[(i + 1) % columns][j].old +
            area[(i + 1) % columns][(j - 1 + lines) % lines].old +
            area[(i + 1) % columns][(j + 1) % lines].old +
            area[i][(j - 1 + lines) % lines].old +
            area[i][(j + 1) % lines].old
        
        var newState = 0
        if area[i][j].old == 1 && (neighbours == 2 || neighbours == 3) {
            newState = 1
        } else if area[i][j].old == 0 && neighbours == 3 {
            newState = 1
        }
        
        var updatedArea = area
        updatedArea[i][j].new = newState
        return updatedArea
    }
}
