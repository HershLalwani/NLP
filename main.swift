import Foundation
import Curses

// Define interrupt handler to terminate Curses with CTRL-C
class Handler : CursesHandlerProtocol {
    func interruptHandler() {
        screen.shutDown()
        print("Good bye!")
        exit(0)
    }

    func windowChangedHandler() {
    }
}

// Start up Curses
let screen = Screen.shared
screen.startUp(handler:Handler())

// Insert your code
let keyboard = Keyboard.shared

let colors = Colors.shared
precondition(colors.areSupported, "This terminal doesn't support colors")
colors.startUp()

let mainWindow = screen.window
    
let white = Color.standard(.white)
let black = Color.standard(.black)
let whiteOnBlack = colors.newPair(foreground:black, background:white)

var titleRow1 = "ooooooooooo oooo                    ooooooooooo                               oooo"
var titleRow2 = "88  888  88  888ooooo   ooooooooo8  88  888  88 oooo  oooo  oo oooooo    ooooo888  oo oooooo   ooooooo   "
var titleRow3 = "    888      888   888 888oooooo8       888      888   888   888   888 888    888   888    888 ooooo888  "
var titleRow4 = "    888      888   888 888              888      888   888   888   888 888    888   888      888    888  "
var titleRow5 = "   o888o    o888o o888o  88oooo888     o888o      888o88 8o o888o o888o  88ooo888o o888o      88ooo88 8o "


var name = ""
var currentCursorY = 0
var inventory = [""]
var weapon = false

// Prints the startup message
mainWindow.clear()
mainWindow.cursor.position = Point(x: 65, y: 8)
mainWindow.write("Welcome to")
mainWindow.cursor.position = Point(x: 20, y: 11)
mainWindow.write(titleRow1)
mainWindow.cursor.position = Point(x: 20, y: 12)
mainWindow.write(titleRow2)
mainWindow.cursor.position = Point(x: 20, y: 13)
mainWindow.write(titleRow3)
mainWindow.cursor.position = Point(x: 20, y: 14)
mainWindow.write(titleRow4)
mainWindow.cursor.position = Point(x: 20, y: 15)
mainWindow.write(titleRow5)
mainWindow.cursor.position = Point(x: 60, y: 20)
mainWindow.write("Type your name below:")
name = mainWindow.getStringFromTextField(at:Point(x:65, y:22), maxCharacters: 20, fieldColorPair:whiteOnBlack)
mainWindow.cursor.position = Point(x: 0, y: currentCursorY + 2)
mainWindow.write("Press F<#> to start the corresponding level")

// Level selector
while true {
    let key = keyboard.getKey(window:mainWindow)
    
    mainWindow.turnOn(Attribute.normal)    
    
    switch(key.keyType) {
    case .function1:
        mainWindow.clear()
        LevelOne().storyTellingOne()
    case .function2:
        mainWindow.clear()
        LevelTwo().battleBear()
    default:
        mainWindow.write("Waiting for input")
    }
    
    mainWindow.refresh()
    if key.keyType == .function4 {
        mainWindow.write("Stopping function")
        break
    }
    
}

// Wait forever, or until the user presses CTRL-C
screen.wait()
