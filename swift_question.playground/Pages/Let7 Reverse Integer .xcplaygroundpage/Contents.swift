//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// getting Int limit 
// Int may vary based on the system
// On 32-bit platforms, Int is the same size as Int32,
// On 64-bit platforms, Int is the same size as Int64.


// lets assume 64-bit platforms
class Solution {
    func reverse(_ x: Int) -> Int {
        var isPositive = true
        if x < 0 {
            isPositive = false
        }
        var num = abs(x)
        var digit: Int = 0
        var res: Int = 0
        while num > 0 {
            digit = num % 10
            num /= 10
            res = res * 10 + digit
        }
        if res > Int(Int32.max) {
            return 0
        }
        
        if isPositive == false {
            return -res
        }
        return res
    }
}