import Curses

class LevelTwo {
    
    private var battleAnswer = ""
    private var fight = false
    private var flight = false
    private var damage = 0
    
    func getRandomRunStory() -> String {
        let runStories = ["You try to run but trip and the bear kills you.", "You try to run but the bear is faster than you.", "You try to run but fall and die."]
        let randomNum = Int.random(in: 0 ... 2)
        
        return runStories[randomNum]
    } 
    
    func battleBear() {
        while true {
            mainWindow.clear()
            mainWindow.write("While searching you hear a sound nearby.")
            currentCursorY = 1
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)        
            mainWindow.write("Its a wild bear that is about to attack you.")
            
            currentCursorY = 2
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
            mainWindow.write("What do you do?")
            
            currentCursorY = 10
            battleAnswer = mainWindow.getStringFromTextField(at:Point(x:0, y:currentCursorY), maxCharacters: 100, fieldColorPair:whiteOnBlack)
            
            let stringArray = battleAnswer.components(separatedBy: " ")
            
            let filteredTokens = NLP().stemming(stringArray: stringArray)
            
            let lemmatizedTokens = NLP().lemmatization(stringArray: filteredTokens)        
            
            for word in lemmatizedTokens {
                switch word {
                case "run":
                    flight = true
                case "fight":
                    fight = true
                    
                case "inventory":
                    currentCursorY = 8
                    mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                    print(inventory)
                default:
                    currentCursorY = 9
                    mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                }
            }
            
            switch inventory[0] {
            case "gun":
                damage = Int.random(in: 15 ... 20)
            case "axe":                
                damage = Int.random(in: 10 ... 20)
            default:
                damage = 0
            }
            
            
            if fight {
                currentCursorY = 8
                mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                if LevelOne().getInv()[0] == "gun" && damage >= 17 {
                    mainWindow.write("You shot the bear and survived")
                } else if LevelOne().getInv()[0] == "axe" && damage >= 16 {
                    mainWindow.write("You fought the bear with your axe and survived")
                } else if LevelOne().isWeaponObtained() && damage < 16 {
                    mainWindow.write("You were not able to kill the bear. Try again")
                } else {
                    mainWindow.write("You didnt have a weapon, so you couldnt defend yourself against the bear.")
                }
                break
            } else {
                currentCursorY = 10
                mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                mainWindow.write(getRandomRunStory())
                break
            }
        }
    }
}
