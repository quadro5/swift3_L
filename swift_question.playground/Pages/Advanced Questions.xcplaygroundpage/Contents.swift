//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Adv Questions"


// Adv Questions

// -------------------------------------------------------------------

// Question #1 - Swift 1.0 or later
// Consider the following structure that models a thermometer:
public struct Thermometer {
    public var temperature: Double
    public init(temperature: Double) {
        self.temperature = temperature
    }
}
// To create an instance, you can obviously use this code:
var t: Thermometer = Thermometer(temperature:56.8)
// But it would be nicer to initialize it this way:
//var thermometer: Thermometer = 56.8
// Can you? How? Hint: it has to do with convertibles, but not convertibles like Camaros and Mustangs :)

/*
Swift defines the following protocols that enable a type to be initialized with literal values by using the assignment operator:
 ExpressibleByNilLiteral
 ExpressibleByBooleanLiteral
 ExpressibleByIntegerLiteral
 ExpressibleByFloatLiteral
 ExpressibleByUnicodeScalarLiteral
 ExtendedGraphemeClusterLiteral
 ExpressibleByStringLiteral
 ExpressibleByArrayLiteral
 ExpressibleByDictionaryLiteral
*/
// Adopting the corresponding protocol and providing a public initializer allows literal initialization of a specific type. In the case of the Thermometer type, you implement the FloatLiteralConvertible protocol as follows:
extension Thermometer : ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self.init(temperature: value)
    }
}

extension Thermometer : ExpressibleByNilLiteral {
    public init(nilLiteral: ()) {
        self.init(temperature: 0.0)
    }
}

extension Thermometer: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self.init(temperature: Double(value))
    }
}

extension Thermometer: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        if value {
            self.init(temperature: 1.0)
        } else {
            self.init(temperature: 0.0)
        }
    }
}

//And now you can create an instance by using a simple float.
var ther0: Thermometer = nil; print(ther0.temperature)
var ther1: Thermometer = 56.8; print(ther1.temperature)
var ther2: Thermometer = 1; print(ther2.temperature)
var ther3: Thermometer = true; print(ther2.temperature)

// -------------------------------------------------------------------

// Question #2 - Swift 1.0 or later
// Swift has a set of predefined operators that perform different types of operations, such as arithmetic or logic. It also allows creating custom operators, either unary or binary.
// Define and implement a custom ^^ power operator with the following specifications:
// Takes two Ints as parameters
// Returns the first parameter raised to the power of the second
// Ignores potential overflow errors

infix operator ^^ // using default precedence level
func ^^(lhs: Int, rhs: Int) -> Int {
    let ll = Double(lhs)
    let rr = Double(rhs)
    let res = pow(ll, rr)
    return Int(res)
}

let res = 2 ^^ 2
print(res)

// -------------------------------------------------------------------

//???

// Question #3 - Swift 1.0 or later
// Can you define an enumeration with raw values like this? Why?

/*
enum Edges : (Double, Double) {
    case TopLeft = (0.0, 0.0)
    case TopRight = (1.0, 0.0)
    case BottomLeft = (0.0, 1.0)
    case BottomRight = (1.0, 1.0)
}
*/

enum DoubleEdge: Double {
    case TopLeft = 0.0
    case TopRight = 1.0
}
enum IntEdge: Int {
    case TopLeft = 0
    case TopRight = 1
}
enum StringEdge: String {
    case TopLeft = "0"
    case TopRight = "1"
}
enum CharacterEdge: Character {
    case TopLeft = "1"
    case TopRight = "0"
}
// No, you cannot. A raw value type must: Conform to the Equatable protocol
// Be literal convertible from any of the following types:
// Int
// String
// Character
//
// In the code above, the raw type is a tuple and is not compatible -- even if its individual values are.

// -------------------------------------------------------------------


// Question #4 - Swift 2.0 or later
// Consider the following code that defines Pizza as a struct and Pizzeria as a protocol, with an extension that includes a default implementation for the method makeMargherita():
struct Pizza {
    let ingredients: [String]
}

protocol Pizzeria {
    func makePizza(ingredients: [String]) -> Pizza
    func makeMargherita() -> Pizza
}

extension Pizzeria {
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "mozzarella"])
    }
}
// You'll now define the restaurant Lombardi’s as follows:
struct Lombardis: Pizzeria {
    func makePizza(ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "basil", "mozzarella"])
    }
}
// The following code creates two instances of Lombardi's. Which of the two will make a margherita with basil?
let lombardis1: Pizzeria = Lombardis()
let lombardis2: Lombardis = Lombardis()

lombardis1.makeMargherita()
lombardis2.makeMargherita()

// They both do. The Pizzeria protocol declares the makeMargherita() method and provides a default implementation. The method is overridden in the Lombardis implementation. Since the method is declared in the protocol in both cases, the correct implementation is invoked at runtime.
// What if the protocol doesn't declare the makeMargherita() method but the extension still provides a default implementation like this?
protocol Pizzeria1 {
    func makePizza(ingredients: [String]) -> Pizza
}

extension Pizzeria1 {
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "mozzarella"])
    }
}

struct Lombardis1: Pizzeria1 {
    func makePizza(ingredients: [String]) -> Pizza {
        return Pizza(ingredients: ingredients)
    }
    func makeMargherita() -> Pizza {
        return makePizza(ingredients: ["tomato", "basil", "mozzarella"])
    }
}

// In this case, only lombardis4 would make the pizza with basil, whereas lombardis3 would make a pizza without it, because it would use the method defined in the extension.

let lombardis3: Pizzeria1 = Lombardis1()
let lombardis4: Lombardis1 = Lombardis1()

// Pizza(ingredients: ["tomato", "mozzarella"])
print(lombardis3.makeMargherita())

// Pizza(ingredients: ["tomato", "basil", "mozzarella"])
print(lombardis4.makeMargherita())

// -------------------------------------------------------------------

// Question #5 - Swift 2.0 or later
// The following code has a compile time error. Can you spot where and why it happens?
/*
struct Kitten {
}

func showKitten(kitten: Kitten?) {
    guard let k = kitten else {
        print("There is no kitten")
    }
    
    print(k)
}
*/
// Hint: There are three ways to fix it.

struct Kitten { }

func showKitten(kitten: Kitten?) {
    guard let k = kitten else {
        print("There is no kitten")
        return
    }
    print(k)
}


// Here's a version that throws an exception.
enum KittenError: Error {
    case NoKitten
}

func showKitten1(kitten: Kitten?) throws {
    guard let k = kitten else {
        print("There is no kitten")
        throw KittenError.NoKitten
    }
    print(k)
}

//try showKitten1(kitten: nil)

do {
    try showKitten1(kitten: nil)
} catch let kittenError {
    print(kittenError)
}

// Finally, here's an implementation calling fatalError(), which is a @noreturn function.

func showKitten2(kitten: Kitten?) {
    guard let k = kitten else {
        print("There is no kitten")
        fatalError()
    }
    print(k)
}













