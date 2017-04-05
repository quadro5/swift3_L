//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Intermediate Questions"


// Intermediate Questions

// -------------------------------------------------------------------

// Question #1 – Swift 2.0 or later
// Consider the following:
var optional1: String? = nil
var optional2: String? = .none
// What’s the difference between nil and .None? How do the optional1 and optional2 variables differ?

// There is no difference. Optional.None (.None for short) is the correct way of initializing an optional variable lacking a value, whereas nil is just syntactic sugar for .None.
// In fact, this statement outputs true:
print(nil == .none) // On Swift 1.x this doesn't compile. You need Optional<Int>.None
//Remember that under the hood an optional is an enumeration:
/*
enum Optional<T> {
    case None
    case Some(T)
}
*/

// -------------------------------------------------------------------

// Question #2 – Swift 1.0 or later
// Here’s a model of a thermometer as a class and a struct:
public class ThermometerClass {
    private(set) var temperature: Double = 0.0
    public func registerTemperature(_ temperature: Double) {
        self.temperature = temperature
    }
}

let thermometerClass = ThermometerClass()
thermometerClass.registerTemperature(56.0)

public struct ThermometerStruct {
    private(set) var temperature: Double = 0.0
    public mutating func registerTemperature(_ temperature: Double) {
        self.temperature = temperature
    }
}

var thermometerStruct = ThermometerStruct()
thermometerStruct.registerTemperature(56.0)
// This code fails to compile. Where? Why?

// add mutating for "func registerTemperature", cause this func change the internal state or internal variable
// make sure "thermometerStruct" is var, that can be modified

// -------------------------------------------------------------------

// Question #3 – Swift 1.0 or later
// What will this code print out and why?
var thing = "cars"

let closure = { [thing] in
    print("I love \(thing)")
}

thing = "airplanes"

closure()

// It’ll print I love cars. The capture list creates a copy of thing when the closure is declared, so the captured value doesn’t change, even if you assign a new value to thing.

// If you omit the capture list in the closure, then the compiler uses a reference instead of a copy. In this case, any change to the variable is reflected when the closure is invoked, as in the following code:

var thing2 = "before"
let closure2 = {
    print("I love \(thing2)")
}
thing2 = "after"
closure2()

// -------------------------------------------------------------------

// Question #4 – Swift 2.0 or later
// Here’s a global function that counts the number of unique values in an array:
func countUniques<T: Comparable>(array: Array<T>) -> Int {
    let sortedArray = array.sorted { $0 < $1 }
    let initial: (T?, Int) = (.none, 0)
    let reducedArray = sortedArray.reduce(initial) { ($1, $0.0 == $1 ? $0.1 : $0.1 + 1) }
    return reducedArray.1
}
// It uses < and == operators, so it restricts T to types that implement, the Comparable protocol.
// You call it like this:
countUniques(array: [1, 2, 3, 3]) // result is 3
// Rewrite this function as an extension method on Array so that you can write something like this:
// [1, 2, 3, 3].countUniques() // should print 3


//In Swift 2.0, generic types can be extended with conditions by enforcing type constraints. If the generic type doesn't satisfy the constraint, the extension is neither visible nor accessible.
extension Array where Element: Comparable {
    func countUniques() -> Int {
        let sortedArray = sorted { $0 < $1 }
        let initial: (Element?, Int) = (.none, 0)
        let reducedArray = sortedArray.reduce(initial) {
            ($1, $0.0 == $1 ? $0.1 : $0.1 + 1)
        }
        return reducedArray.1
    }
}

[1, 2, 3, 3].countUniques() // should print 3

// -------------------------------------------------------------------

// Question #5 - Swift 2.0 or later
// Here's a function to calculate divisions given to two (optional) doubles. 

// There are three preconditions to verify before performing the actual division:
// The dividend must contain a non nil value
// The divisor must contain a non nil value
// The divisor must not be zero
func divide(dividend: Double?, by divisor: Double?) -> Double? {
    if dividend == .none {
        return .none
    }
    
    if divisor == .none {
        return .none
    }
    
    if divisor == 0 {
        return .none
    }
    
    return dividend! / divisor!
}
// This code works as expected but has two issues:
// The preconditions could take advantage of the guard statement
// It uses forced unwrapping
// Improve this function using the guard statement and avoid the usage of forced unwrapping.

func divide2(dividend: Double?, by divisor: Double?) -> Double? {
    guard let dividend = dividend,
        let divisor = divisor,
        divisor != 0
        else {
            return nil
    }
    return dividend / divisor
}









