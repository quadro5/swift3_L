//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Basic Questions"


// Basic Question

// -------------------------------------------------------------------

/// Question #1 – Swift 1.0 or later
/// What’s a better way to write this for loop with ranges?
/*
 for var i = 0; i < 5; i++ {
 print("Hello!")
 }
 */

for _ in 0..<0 {
    print("Hello!")
}

// ------------------------------------------------------------------

/// Question #2 – Swift 1.0 or later
/// Consider the following:
struct Tutorial {
    var difficulty: Int = 1
}

var tutorial1 = Tutorial()
var tutorial2 = tutorial1
tutorial2.difficulty = 2
/// struct are copied by value

// ------------------------------------------------------------------

// Question #3 – Swift 1.0 or later
// view1 is declared with var, and view2 is declared with let. What’s the difference here, and will the last line compile?
import UIKit

var view1 = UIView()
view1.alpha = 0.5

let view2 = UIView()
view2.alpha = 0.5 // Will this line compile?
// view1 is a variable and can be re-assigned to a new instance of UIView. With let you can assign a value only once, so the following code doesn’t compile:
// view2 = view1 // Error: view2 is immutable
// However, UIView is a class with reference semantics, so you can mutate the properties of view2 (which means the last line will compile):

// ------------------------------------------------------------------

// Question #4 – Swift 1.0 or later
// This code sorts an array of names alphabetically and looks complicated. Simplify it and the closure as much as you can.
let animals = ["fish", "cat", "chicken", "dog"]
let sortedAnimals = animals.sorted { (one: String, two: String) -> Bool in
    return one < two
}
// type inference system can calculate the type of the parameters in the closure
let mod1 = animals.sorted {
    (one, two) -> Bool in
    return one < two
}
// return type can be inferred
let mod2 = animals.sorted {
    (one, two) in
    return one < two
}
// $i notation can substitute the parameter names
let mod3 = animals.sorted {
    return $0 < $1
}
// In single statement closures, the return keyword can be omitted. The return value of the last statement becomes the return value of the closure:
let mod4 = animals.sorted { $0 < $1 }


// ------------------------------------------------------------------

// Question #5 – Swift 1.0 or later
// This code creates two classes, Address and Person, and it creates two instances to represent Ray and Brian.
class Address {
    var fullAddress: String
    var city: String
    
    init(fullAddress: String, city: String) {
        self.fullAddress = fullAddress
        self.city = city
    }
}

class Person {
    var name: String
    var address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}

var headquarters = Address(fullAddress: "123 Tutorial Street", city: "Appletown")
var ray = Person(name: "Ray", address: headquarters)
var brian = Person(name: "Brian", address: headquarters)
// Suppose Brian moves to the new building across the street, so you update his record like this:
brian.address.fullAddress = "148 Tutorial Street"
// What’s going on here? What’s wrong with this?


//Ray also moved to the new building! Address is a class and has reference semantics, so headquarters is the same instance, whether you access it via ray or brian. Changing the address of headquarters will change it for both.

// Solution:
//  add new Address into ray, separate instances for Address
//  change Address to struct, with copied by value


