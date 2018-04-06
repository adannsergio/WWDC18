//#-code-completion(everything, hide)
//#-hidden-code
_setup()
_canvasScene()
import Foundation

// Numbers inputed by user
var tRexNumber = 0
var brachiosaurusNumber = 0

// Alternatives that are showed below blackboard
var a1 = Text()
var a2 = Text()
var a3 = Text()

// Result in text that is showed below sum line
var resultText = Text()

// Result in value that is showed below sum line
var resultValue = 0

// Variable to mark what alternative was touched
var alternativeChoosen = 0

var randonActivate = false

// Random numbers that are  showed in alternatives a1, a2 or a3
var number1 = Int(arc4random_uniform(20))
var number2 = Int(arc4random_uniform(20))
var number3 = Int(arc4random_uniform(20))

// Func that user interact to define if the numbers will be random or not
func randomNumbers(_ status:String = "off") {
    switch status.lowercased() {
    case "on":
        randonActivate = true
        
        let randomNumber1 = Int(arc4random_uniform(6) + 1)
        let randomNumber2 = Int(arc4random_uniform(6) + 1)
        tRexNumber = randomNumber1
        brachiosaurusNumber = randomNumber2
        
        var tRexString = ""
        for _ in 1...randomNumber1 {
            tRexString.append("🦖")
        }
        let firstNumber = Text(string: tRexString, fontSize: 40)
        firstNumber.center.y += 23
        
        var brachiosaurusString = ""
        for _ in 1...randomNumber2 {
            brachiosaurusString.append("🦕")
        }
        let secondNumber = Text(string: brachiosaurusString, fontSize: 40)
        secondNumber.center.y += 13
    case "off":
        break
    default:
        break
    }
}

// Func that user interact seting the number of t-rex
func tRex (number:Int = 3) {
    if !randonActivate {
        // input validation
        var numberInputed = number
        if number > 7 {
            numberInputed = 7
        }
        if number < 1 {
            numberInputed = 1
        }
    
        tRexNumber = numberInputed
        var tRexString = ""
        for _ in 1...numberInputed {
            tRexString.append("🦖")
        }
        let firstNumber = Text(string: tRexString, fontSize: 40)
        firstNumber.center.y += 23
    }
}

// Func that user interact seting the number of brachiosaurus
func brachiosaurus (number: Int = 4) {
    if !randonActivate {
        var numberInputed = number
        // input validation
        if number > 7 {
            numberInputed = 7
        }
        if number < 1 {
            numberInputed = 1
        }
    
        brachiosaurusNumber = numberInputed
        var brachiosaurusString = ""
        
        for _ in 1...numberInputed {
            brachiosaurusString.append("🦕")
        }
        let secondNumber = Text(string: brachiosaurusString, fontSize: 40)
        secondNumber.center.y += 13
    }
}


//#-end-hidden-code
//: # Become The Master of Dinumbers!
//: ### This game was made to help kids in basic math, so they can practice with dinosaurs!
//: Naturally, when we are in childhood, we have so many ways to learn. Sometimes bringing our games can help in this process.
//: In that sense, you can set numbers of T-Rex and Brachiosaurus *- I love dinosaurs!* and play with basic math! Math For Kids with ❤️ and 👨‍💻 by Adann Simões.
//: ### Follow these steps:
/*:
 **Step 1:** Count each T-Rex and Branchiosaurus.
 
 **Step 2:** Tap one of three options under the blackboard!
 
 **Step 3:** Tap the CHECK button and see what happens :)
 - **Attention:** Only numbers between **1 to 7** are accepted
 ### Set **on** if you want random numbers or **off** if you will set numbers of T-Rex and Brachiosaurus:
 */
randomNumbers(/*#-editable-code */"off"/*#-end-editable-code*/)
/*:
 ### Set the number of T-Rex and Brachiosaurus:
*/
tRex(number: /*#-editable-code */3/*#-end-editable-code*/)
brachiosaurus(number: /*#-editable-code */4/*#-end-editable-code*/)

//#-hidden-code

// Set all alternative and show it on screen
let diceDecision = Int(arc4random_uniform(3) + 1)
if diceDecision == 1 { // alternative 1
    a1 = Text(string: "\(tRexNumber + brachiosaurusNumber)", color: .red)
    a1.center.y += -9
    a1.center.x += -20
    
    a2 = Text(string: "\(number2)", color: .red)
    a2.center.y += -9
    
    a3 = Text(string: "\(number3)", color: .red)
    a3.center.y += -9
    a3.center.x += 20
    
    number1 = tRexNumber + brachiosaurusNumber
} else if diceDecision == 2 { // alternative 2
    a1 = Text(string: "\(number1)", color: .red)
    a1.center.y += -9
    a1.center.x += -20
    
    a2 = Text(string: "\(tRexNumber + brachiosaurusNumber)", color: .red)
    a2.center.y += -9
    
    a3 = Text(string: "\(number3)", color: .red)
    a3.center.y += -9
    a3.center.x += 20
    
    number2 = tRexNumber + brachiosaurusNumber
} else { // alternative 3
    a1 = Text(string: "\(number1)", color: .red)
    a1.center.y += -9
    a1.center.x += -20
    
    a2 = Text(string: "\(number2)", color: .red)
    a2.center.y += -9
    
    a3 = Text(string: "\(tRexNumber + brachiosaurusNumber)", color: .red)
    a3.center.y += -9
    a3.center.x += 20
    
    number3 = tRexNumber + brachiosaurusNumber
}

// Setting the Check button view
let rectangleText = Rectangle(width: 15, height: 5, cornerRadius: 0.75)
rectangleText.color = .blue
rectangleText.center.y += -16

let checkText = Text(string: "CHECK", fontSize: 40)
checkText.center.y += -16

// All onTouch func - The user interact with liveView touching in one of three alternatives
a1.onTouchUp {
    if alternativeChoosen == 0 {
        alternativeChoosen = 1
        
        a1.color = .black
        a2.color = .red
        a3.color = .red
    
        resultText = Text(string: "\(number1)", fontSize: 60, color: .white)
        resultText.center.y += 5
        
        resultValue = number1
    }
}

a2.onTouchUp {
    if alternativeChoosen == 0 {
        alternativeChoosen = 2
        
        a2.color = .black
        a1.color = .red
        a3.color = .red
    
        resultText = Text(string: "\(number2)", fontSize: 60, color: .white)
        resultText.center.y += 5
        
        resultValue = number2
    }
}

a3.onTouchUp {
    if alternativeChoosen == 0 {
        alternativeChoosen = 3
        
        a3.color = .black
        a1.color = .red
        a2.color = .red
        
        resultText = Text(string: "\(number3)", fontSize: 60, color: .white)
        resultText.center.y += 5
        
        resultValue = number3
    }
}


checkText.onTouchUp {
    // The user must choose one of three alternatives
    if (alternativeChoosen != 0) {
        if (tRexNumber + brachiosaurusNumber) == resultValue {
            let messagePart1 = Text(string: "🦖 = \(tRexNumber)", fontSize: 40)
            let messagePart2 = Text(string: "🦕 = \(brachiosaurusNumber)", fontSize: 40)
            
            messagePart1.center.y += -24
            messagePart1.center.x += -10
            messagePart2.center.y += -31
            messagePart2.center.x += -10
            
            let lineFeedBackMessage = Line(start: Point(x: 0, y: -34), end: Point(x: 0, y: -21), thickness: 0.5)
            lineFeedBackMessage.color = .orange
            
            let messagePart3 = Text(string: "\(tRexNumber) + \(brachiosaurusNumber) = \(tRexNumber + brachiosaurusNumber)", fontSize: 40)
            messagePart3.center.y += -24
            messagePart3.center.x += 12
            
            let messagePart4 = Text(string: "🧙‍♂️", fontSize: 50)
            let messagePart5 = Text(string: "RIGHT!", fontSize: 20, color: .blue)
            
            messagePart4.center.y += -30
            messagePart4.center.x += 5
            messagePart5.center.y += -31
            messagePart5.center.x += 12
            
        } else {
            let messagePart1 = Text(string: "🦖 = \(tRexNumber)", fontSize: 40)
            let messagePart2 = Text(string: "🦕 = \(brachiosaurusNumber)", fontSize: 40)
            
            messagePart1.center.y += -24
            messagePart1.center.x += -10
            messagePart2.center.y += -31
            messagePart2.center.x += -10
            
            let lineFeedBackMessage = Line(start: Point(x: 0, y: -34), end: Point(x: 0, y: -21), thickness: 0.5)
            lineFeedBackMessage.color = .orange
            
            let messagePart3 = Text(string: "\(tRexNumber) + \(brachiosaurusNumber) = \(tRexNumber + brachiosaurusNumber)", fontSize: 40)
            messagePart3.center.y += -24
            messagePart3.center.x += 12
            
            let messagePart4 = Text(string: "🧙‍♂️", fontSize: 50)
            let messagePart5 = Text(string: "TRY AGAIN!", fontSize: 20, color: .red)
            
            messagePart4.center.y += -30
            messagePart4.center.x += 5
            messagePart5.center.y += -31
            messagePart5.center.x += 14
            
            let wrongLine = Line(start: Point(x: -4, y: 1), end: Point(x: 5, y: 8), thickness: 0.5)
            wrongLine.color = .red
            
            
        }
    }
    
}
