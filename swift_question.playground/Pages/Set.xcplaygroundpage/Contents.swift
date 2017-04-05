//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

var testSet = Set<Int>()

// add
let ins1 = testSet.insert(1)
let ins2 = testSet.insert(2)
let ins3 = testSet.insert(3)
let ins4 = testSet.insert(4)
let ins42 = testSet.insert(4)
print("insert:   \(ins4)")


// contains
if testSet.contains(2) {
    print("set has 2")
} else {
    print("set has not 2")
}

// formUnion
let array = [4, 5, 6]
let testSet1 = Set<Int>([2, 3, 4, 5])
testSet.formUnion(testSet1)
testSet.formUnion(array)



// traversal
for element in testSet {
    let hehe = element
}

testSet.forEach { (element) in
    let hehe = element
}

// remove
let remove1 = testSet.remove(1) // return what I removed
testSet.removeAll()
testSet.removeAll(keepingCapacity: true)




//remove duplicate
/*
- (void) getUniqueArray {
    NSArray *nums = @[@1, @2, @3, @4, @2, @1];
    NSArray *uniNums = [[NSSet setWithArray:nums] allObjects];
    NSLog(@"%@", uniNums);}
*/
let arrayDup = [1, 2, 3, 4, 5, 5, 5, 5]
let dedup = Set<Int>(arrayDup)






