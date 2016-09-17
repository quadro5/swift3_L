
//: Playground - noun: a place where people can play

import UIKit
// --------------------------------------------------------------
// Simple Values
// var means variable
var str = "Hello, playground"

var varInt1 = 10
var varInt2: Int
varInt2 = 10

var varInt3 = 0
varInt3 = 20

// let means constant
let varInt4: Int
varInt4 = 1

let hehe : Float = 4.0
print(hehe);

// p6 exmaple
let label = "hehe"
let width = 94
let widthLabel = label + String(width)


// p7 example "\()"
let apples = 3
let oranges : Float = 5
let appleSummaty = "I have \(apples) apples"
let fruitSummy = "I have \(Float(apples) + oranges) fruits"


// p9
// array
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

// dict
var occupations = [
    "Malcolm" : "Captain",
    "Kaylee" : "Mechanic"
]
occupations["Jayne"] = "Public Relations"

// init
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
shoppingList = []
shoppingList = ["hehe","haha"]
occupations = [:]


// ---------------------------------------------------
// Control Flow
// p10 control flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore);

// optional value
var optionalString: String? = "Hello"
print(optionalString == nil);

var optionalName1: String?
var optionalName2: String? = "John Appleseed"
let optionalName3 = [Int]()
var greeting: String

if let name = optionalName2 {
    greeting = "Hello, hehe"
} else {
    greeting = "else"
}
print(greeting);

// p12
// “Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.”
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? (fullName))"
let hehehe = "hehe \(nickName ?? "xxx")"

// Switch
// p13
let vegetable: String = "celery pepper"
switch vegetable {
case "celery pepper":
    print("Add some raisions")
    print("Add some raisions")
case "cucumber", "watercress":
    print("that would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup")
}

// p14
let interestingNumbers = [
    "Prime" :[2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25],
]
// Experiment
// "Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.”
var largest = 0
var second = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            second = largest
            largest = number
        }
    }
}
print(largest, second)

// p14
var n = 2
while n < 100 {
    n = n * 2
}

// p15
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

print(n);
for (kind, numbers) in interestingNumbers {
    if kind == "Prime" {
        for x in interestingNumbers[kind]! {
            n += x
        }
    }
}

var total = 0
for i in 0..<4 {
    total += i
}
var shenTM: Float = 0.0
for i in 0..<4{
    shenTM = Float(i)
}

for i in 0..<Int(shenTM) {
    print(i)
}

print(total)
// -------------------------------------------------
// Functions and Closures
// p15
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

// p16
// Experiment
// Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.”
func greet(person: String, item lunchspecial: String) -> String {
    return "Hello \(person), today is \(lunchspecial)."
}
greet(person: "Bob", item: "Beef")

// p16
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

// add try
func greet2(_ person: String, _ day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet2("Wald", "Firday")
var name = "wald"
var dayname = "Friday"
greet(person: name, day: dayname)
greet2(name, dayname)

// p16
func calculateStatistics(scores: [Int])
    -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum: Int = 0
        
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3 ,9])
print(statistics.sum)
print(statistics.2)

// p17
func sumOf(numbers: Int...)
    -> Int {
    var sum = 0
        for number in numbers{
            sum += number
        }
        return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

// p18
// Experiment
// Write a function that calculates the average of its arguments.”
func getAve(scores: [Int])
    -> Int {
    var sum: Int = 0
    var cnt: Int = 0
    var ave: Int = 0
    for score in scores {
        cnt = cnt + 1
        sum += score
    }
    if cnt == 0 {
        return 0
    }
    ave = sum / cnt
    return ave
}

// p21
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// p19
// “Functions are a first-class type. This means that a function can return another function as its value.”
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment)
var value_increment = increment(7)
print(value_increment)

// p20
func hasAnyMatches(
    list: [Int],
    condition: (Int) -> Bool) -> Bool{
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// p23
// Closures
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
// Experiment
// "Rewrite the closure to return zero for all odd numbers"
var numbers1 = [1, 2, 3, 4]
numbers1.map({
    (number: Int) -> Int in
    let tmp = number % 2
    if tmp != 0 {
        return 0
    }
    return 1
})
func getNumber(number: Int) -> Int {
    return number
}

// p21
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let ace_sortedNumbers = numbers.sorted { $0 > $1}
let dec_sortedNumbers = numbers.sorted { $0 < $1}
print(ace_sortedNumbers)
print(dec_sortedNumbers)

// ------------------------------------------------------------
// p23
// Obj and Classes
// Experiment
// "Add a constant property with let, and add another method that takes an argument.”
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    let id = 0x10
    func printId() -> String {
        return "\(id)"
    }
}

// p23
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapeId = shape.printId()
print(shapeId)

// p24
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    deinit {
        print("Deleting")
    }
}

// p25
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }

}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())

// p26
// Experiment
// "Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.”
class Circle: NamedShape {
    var radius: Double
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return 3.14 * radius * radius
    }
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
    
}
let test_circle = Circle(radius: 3.0, name: "Circle")
print("Radius: ", test_circle.area())
print("Des: ", test_circle.simpleDescription())


// p26
//“In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.

// Notice that the initializer for the EquilateralTriangle class has three different steps:

// 1. Setting the value of properties that the subclass declares.
// 2. Calling the superclass’s initializer.
// 3. Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
    
        get {
            return 3.0 * sideLength
        }
    
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print("get perimeter", triangle.perimeter)
triangle.perimeter = 9.9
print("get sideLength", triangle.sideLength)


// p29
// “If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use "willSet" and "didSet". The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always ”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name:name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "Larger square")
print(triangleAndSquare.triangle.sideLength)

// p30
// “When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")

let sideLength = optionalSquare?.sideLength

// -------------------------------------------------------------
// P30
// Enumerations and Structures
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace: Rank = Rank.ace
let jack = Rank.jack
let queenquen = Rank.queen
let aceRawValue = ace.rawValue
let jackRawValue = ace.rawValue

// p32
// Experiment
// "Write a function that compares two Rank values by comparing their raw values.”
func compRawValue(left: Rank, right: Rank) -> Bool {
    if left.rawValue < right.rawValue{
        return true
    } else {
        return false
    }
}
let compResult = compRawValue(left: ace, right: jack)


// p32
// “By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values.”

// “Use the init?(rawValue:) initializer to make an instance of an enumeration from a raw value.”

// “The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

if let convertedRank = Rank(rawValue: 11) {
    let threeDescription = convertedRank.simpleDescription()
    print(threeDescription)
}

// p34
enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs, black
    func simpleDescription() -> String {
        switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            default:
                return "simpleDes default"
        }
    }
    // Experiment
    // "Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.”
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        default:
            return "color default"
        }
    }
}
let hearts = Suit.hearts
let heartDescription = hearts.simpleDescription()
let black = Suit.black
let blackDescription = black.simpleDescription()


// p36
// “One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    // Experiment
    func createFulldeck() -> String {
        return "11111"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// Experiment
// Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.”
class CardExperiment {
    var rank: Rank
    var suit: Suit
    
    init(cardRank: Rank, cardSuit: Suit) {
        self.rank = cardRank
        self.suit = cardSuit
    }
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    // To get a full deck we need to loop through all the ranks, assign each suit and put those into an array. The rank has a int raw value so we can use that.
    func fullDeck() -> [Card] {
        var deck = [Card]()
        var n = 1
        while let r = Rank(rawValue: n) {
            var m = 1
            while let s = Suit(rawValue: m) {
                deck.append(Card(rank: r, suit: s))
                m += 1
            }
            n += 1
        }
        return deck
    }
}
let threeBar = CardExperiment(cardRank: .three, cardSuit: .spades)
let threeBarDescription = threeOfSpades.simpleDescription()
threeBar.fullDeck()


// p38
enum SeverResponse {
    case result(String, String)
    case failure(String)
    // experiment
    case reset(String, String, String)
}

let success = SeverResponse.result("6:00 am", "8:09 pm")
let failure = SeverResponse.failure("Out of cheese")
let reset = SeverResponse.reset("Wang", "Guang", "CHong qi");

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at\(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure.. \(message)")
case let .reset(name1, name2, operation):
    print("Reset.. \(name1), \(name2), \(operation)")
}

// ---------------------------------------------------------------
// Protocols and Extensions
// p39
// Example protocol
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Example class conform protocol
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

// Example struct conform protocol
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// Experiment
// “Write an enumeration that conforms to this protocol.”
// Version 1
enum SimpleEnum : ExampleProtocol {
    case Red, Green, Blue, Adjusted
    func getDescription() -> String {
        switch self {
        case .Red:
            return "Red"
        case .Green:
            return "Green"
        case .Blue:
            return "Blue"
        default:
            return "Adjusted"
        }
    }
    var simpleDescription: String {
        return self.getDescription()
    }
    
    mutating func adjust() {
        self = SimpleEnum.Adjusted
    }
}
var c = SimpleEnum.Red
c.adjust()
let cDescription = c.getDescription()

// Version 2
enum SimpleEnum2 : ExampleProtocol {
    case Red, Green, Blue, Adjusted
    var simpleDescription: String {
        switch self {
        case .Red:
            return "Red"
        case .Green:
            return "Green"
        case .Blue:
            return "Blue"
        default:
            return "Adjusted"
        }
    }
    mutating func adjust() {
        self = SimpleEnum2.Adjusted
    }
}
var d = SimpleEnum.Red
d.adjust()
let dDescription = d.simpleDescription

// Version 3 - avoiding "switch self" to perform additional copy
/* 
// Example
// http://stackoverflow.com/questions/24011170/how-to-make-an-enum-conform-to-a-protocol-in-swift
enum SimpleEnum3 : ExampleProtocol {
    case Basic, Adjusted
    var simpleDescription: String {
        get {
            return "\(self.rawValue)"
        }
    }
    mutating func adjust() {
        self = .Adjusted
    }
}
 */

// p41
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
var numInt = 7
numInt.adjust()
print(numInt.simpleDescription)

// p41
// Experiment
// Write an extension for the Double type that adds an absoluteValue property.”
extension Double{
    var absoluteValue: Double {
        return abs(self)
    }
}
var doubleValue: Double = -0.1
var doubleAbs = doubleValue.absoluteValue

// p42
// “Even though the variable protocolValue has a runtime type of SimpleClass, the compiler treats it as the given type of ExampleProtocol. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.”

// when you work with values whose type is a protocol type, methods outside the protocol definition are not available

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)

// ----------------------------------------------------------------
// p42
// Error handling
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String{
    /*
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    if printerName == "On Fire" {
        throw PrinterError.onFire
    }
    */
    switch printerName {
        case "Never Has Toner":
            throw PrinterError.noToner
        case "On Fire":
            throw PrinterError.onFire
        case "Out Of Paper":
            throw PrinterError.outOfPaper
        default:
            break
    }
    return "Job sent"
}
do {
    let printerResponse = try send(job: 1030, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

// p44
// Experiment
// “Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.”
do {
    let printerResponse = try send(job: 1030, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

// p45
do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError)")
} catch {
    print(error)
}

// p45
// Experiment
// “Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?”
do {
    let printerResponse = try send(job: 1440, toPrinter: "hehe")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    // catch other error except "onFire"
    print("Printer error: \(printerError)")
} catch {
    // if no error
    print(error)
}
let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1995, toPrinter: "Never Has Toner")

// p46
// “Use defer to write a block of code that is executed after all other code in the function, just before the function returns. The code is executed regardless of whether the function throws an error. You can use defer to write setup and cleanup code next to each other, even though they need to be executed at different times.”

// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 3).” iBooks. https://itun.es/us/jEUH0.l

// p47
var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("banana")
print(fridgeIsOpen)

// ---------------------------------------------------------------
// Generics
// p48
// "Item" is a type
func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// Reimplement the Swift standard library's optional type”
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}

var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
print(possibleInteger)

// p49
func anyCommonElements<T: Sequence, U: Sequence>
    (_ lhs: T, _ rhs: U) -> Bool
where   T.Iterator.Element: Equatable,
    T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])


// Experiment
// “Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.”

func commonElement<T: Sequence, U: Sequence> (_ lhs: T, _ rhs: U) -> [Int] where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var result = [Int]()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                result.append(lhsItem as! Int)
            }
        }
    }
    return result
}
var commonElementSeq = commonElement([1,2,3,4,5], [2,3,4,5])


// “Writing <T: Equatable> is the same as writing <T> ... where T: Equatable>.”
// Explain:
// https://www.andrewcbancroft.com/2015/07/01/every-swift-value-type-should-be-equatable/#disqus_thread
