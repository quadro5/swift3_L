//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



var dict1 = Dictionary<Int, Int>()


// contain
if dict1[3] != nil {
    print("dict1 has key 3")
} else {
    print("dict1 has not key 3")
}

var dict2 = Dictionary<Int, Int?>()
dict2[3] = nil
dict2.count

if dict2[3] != nil {
    print("dict2 has key 3")
} else {
    print("dict2 has not key 3")
}


// add
dict1[1] = 11
dict1[2] = 22
let hehe = dict1.updateValue(22, forKey: 10)
print(hehe ?? -1)
print(dict1[10] ?? -1)



// remove
// remove key
let value = dict1.removeValue(forKey: 1)

// remove all
dict1.removeAll(keepingCapacity: true)
dict1.removeAll()






