//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)





var addBlock: (Int, Int) -> (Int) = {
    (a, b) -> Int in
    return a + b
}





/// -------------------------------------------------------------
/// Struct - value / ref test

struct TestStruct {
    var str = "hehe"
    mutating func modify() {
        str = "haha"
        print("modify: \(str)")
    }
    func noModify() {
        print("moModify: \(str)")
    }
}

let letStuct = TestStruct() // cannot call .modify
var varStruct = TestStruct() // can call .modify

// letStuct.modify() // error
varStruct.noModify()


func copyStruct(copy: TestStruct) -> String{ // copy
    // copy.modify() // value tansInto is "let" for struct
    var copyVar = copy
    copyVar.modify()
    return copyVar.str
}

func refStruct(ref: inout TestStruct) -> String { // reference
    ref.modify()
    return ref.str
}

// compare the result of copy
let res1 = copyStruct(copy: varStruct)
varStruct.str

// compare the result of ref
let res2 = refStruct(ref: &varStruct)
varStruct.str


/// -----------------------------------------------------------------
/// Class - value / ref test

class TestClass {
    var str = "hehe"
    func modify() {
        str = "haha"
    }
    func noModify() { }
}

func copyClass(copy: TestClass) -> String { // reference
    copy.modify()
    return copy.str
}

func refClass(ref: inout TestClass) -> String { // reference
    ref.modify()
    return ref.str
}
let letClass = TestClass()
var varClass = TestClass()

letClass.str = "111"
varClass.str = "111"

// letClass = TestClass() // "let "cannot reassign a TestClass instance
varClass = TestClass() // "var" can reassign a TestClass instance


// use default ref
let res3 = copyClass(copy: letClass)
letClass.str

let res4 = copyClass(copy: varClass)
varClass.str


// use keyword "inou" and explict ref
letClass.str = "111"
varClass.str = "111"
// let res5 = refClass(ref: &letClass) // "let" cannot
let res6 = refClass(ref: &varClass)
varClass.str

