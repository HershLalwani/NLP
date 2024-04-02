import Curses

class LevelOne {

    private var answer1 = ""
    private var answer2 = ""
    private var answer3 = ""
    private var movement = false
    private var house = false
    private var car = false
    private var take = false    
        
    func storyTellingOne() {
        ///////////////////////////////////////////
        // Tells the story and current situation //
        ///////////////////////////////////////////
        currentCursorY = 0
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("You awake in a cold, cold place. You dont know where you are, or how you got here. All you know is your name: \(name).")
        
        currentCursorY += 1
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("You see a path near where you wake up, it splits into two up ahead.")
        
        currentCursorY += 1
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("Your two choices are the left path and the right path. The left path leads to the house and the right path leads to the car.")
        
        currentCursorY += 1
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("What do you do?")
        
        // Waits for user response
        currentCursorY = 10
        answer1 = mainWindow.getStringFromTextField(at:Point(x:0, y:currentCursorY), maxCharacters: 100, fieldColorPair:whiteOnBlack)
        
        // Processes the response from the user
        let stringArray = answer1.components(separatedBy: " ")
        
        let filteredTokens = NLP().stemming(stringArray: stringArray)
        
        let lemmatizedTokens = NLP().lemmatization(stringArray: filteredTokens)
        
        // Uses the left over array and looks for keywords
        for word in lemmatizedTokens {
            switch word {
            case "go":
                movement = true
            case "house", "left":
                house = !house
                break
            case "car", "right":
                car = !car
                break
            case "no":
                car = !car
                house = !house
                
            default:
                currentCursorY = 9
                mainWindow.write("Please enter a valid response")
            }
        }
        
        // Using the response, sends the user to the next section
        if movement && car {
            storyTellingCar()
        } else if movement && house {
            storyTellingHouse()
        }
    }
    
    
    func storyTellingCar() {
        /////////////////////
        // Tells the story //
        /////////////////////
        mainWindow.clear()
        currentCursorY = 1
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        
        mainWindow.write("You walk to the car to look for anything that can help you.")
        currentCursorY = 2
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        
        mainWindow.write("In the trunk of the car, you see a woodcutting axe. This could be useful to you.")
        currentCursorY = 3
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        
        mainWindow.write("Do you take the axe?")
        currentCursorY = 4
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)

        // Waits for new user response
        currentCursorY = 10
        answer2 = mainWindow.getStringFromTextField(at:Point(x:0, y:currentCursorY), maxCharacters: 100, fieldColorPair:whiteOnBlack)

        //
        // Again filteres the response from the user
        //
        let stringArray = answer2.components(separatedBy: " ")
        
        let filteredTokens = NLP().stemming(stringArray: stringArray)
        
        let lemmatizedTokens = NLP().lemmatization(stringArray: filteredTokens)

        for word in lemmatizedTokens {
            switch word {
            case "take":
                take = !take
                weapon = !weapon
            case "axe":
                weapon = !weapon
            case "no":
                take = !take
                weapon = !weapon
                
                break
            default:
                currentCursorY = 9
                mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                mainWindow.write("Please enter a valid response")
            }
        }
        if take && weapon {
            inventory[0] = "axe"
            currentCursorY = 11
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
            mainWindow.write("You chose to take the axe, good choice \(name).")
        } else {
            currentCursorY = 11
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
            mainWindow.write("You chose to leave the axe, you might regret that decision \(name).")
        }
        currentCursorY = 12
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("Press F2 to proceed to the next level")
    }

    func storyTellingHouse() {
        mainWindow.clear()
        currentCursorY = 1
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("You chose to go to the house to see if there is anything you can find.")
        
        currentCursorY = 2
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        
        mainWindow.write("You look around the house and find a safe that is slightly open, which has a gun in it.")

        currentCursorY = 3
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        
        mainWindow.write("Do you take the gun?")

        currentCursorY = 10
        
        answer3 = mainWindow.getStringFromTextField(at:Point(x:0, y:currentCursorY), maxCharacters: 100, fieldColorPair:whiteOnBlack)
        
        let stringArray = answer3.components(separatedBy: " ")
        
        let filteredTokens = NLP().stemming(stringArray: stringArray)
        
        let lemmatizedTokens = NLP().lemmatization(stringArray: filteredTokens)
        
        for word in lemmatizedTokens {
            switch word {
            case "take":
                take = !take
                weapon = !weapon
            case "gun":
                weapon = !weapon
            case "no":
                take = !take
                weapon = !weapon
                break
            default:
                currentCursorY = 9
                mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
                mainWindow.write("Please enter a valid response")
            }
        }
        
        if take && weapon {
            inventory[0] = "gun"
            currentCursorY = 11
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
            mainWindow.write("You chose to take the gun, good choice \(name).")
        } else {
            currentCursorY = 11
            mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
            mainWindow.write("You chose to leave the gun, you might regret that decision \(name).")
        }
        currentCursorY = 12
        mainWindow.cursor.position = Point(x: 0, y: currentCursorY)
        mainWindow.write("Press F2 to proceed to the next level")
    }
    
    func isWeaponObtained() -> Bool {
        return weapon
    }
    
    func getInv() -> [String] {
        return inventory
    }
}
