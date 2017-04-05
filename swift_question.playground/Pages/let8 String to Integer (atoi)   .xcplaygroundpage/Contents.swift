//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// Int overflow 

/* when you specifically want an overflow condition to truncate the number of available bits, you can opt in to this behavior rather than triggering an error. Swift provides three arithmetic overflow operators that opt in to the overflow behavior for integer calculations. These operators all begin with an ampersand (&):

Overflow addition (&+)
Overflow subtraction (&-)
Overflow multiplication (&*)
 
https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-ID37
*/


class Solution {
    func myAtoi(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        var res: Int = 0
        let s = "0"
        let base = Array(s.utf8)[0]
        
        let array = Array(str.utf8)
        //let len = array.count
        for ch in array {
            let digit = Int(ch - base)
            res = res &* 10
            if (res == 0) {
                return res
            }
            res = res &+ digit
            if (res < 0) {
                return 0
            }
        }
        return res
    }
}


let input = "123333333333333333333333333333333333333333"
let res = Solution().myAtoi(input)



// leetcode version
class Solution2 {
    func myAtoi(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        var res: Int64 = 0
        let s = "09+- "
        let base = Array(s.utf8)
        let array = Array(str.utf8)
        let len = array.count
        var start = 0
        var isPositive: Bool = true
        // trim space
        while start < len && array[start] == base[4] {
            start += 1
        }
        // validate start
        if start >= len {
            return 0
        }
        // validate sign
        if array[start] == base[2] {
            isPositive = true
            start += 1
        } else if array[start] == base[3] {
            isPositive = false
            start += 1
        }
        // searching for pure num
        for index in start..<len {
            let cur = array[index]
            // validate utf8 num
            if cur < base[0] || cur > base[1] {
                break
            }
            // get digit
            let digit = Int(cur - base[0])
            
            // validate with overflow
            // res = res * 10 + digit
            res = res * 10 + Int64(digit)
            if res > Int64(Int32.max), isPositive {
                return Int(Int32.max)
            }
            if res > Int64(Int32.max), isPositive == false {
                return Int(Int32.min)
            }
        }
        if isPositive == false {
            return Int(-res)
        }
        return Int(res)
    }
}

// Roman to Integer

func romanToInteger(str: String) -> Int {
    let nums = str.characters.map { String($0) }
    let len = nums.count
    if nums.isEmpty {
        return 0
    }
    var res = 0
    var prev = 0
    var cur = mapRomanToInt(nums[0])
    res += cur
    
    var index = 1
    while index < len {
        prev = cur
        cur = mapRomanToInt(nums[index])
        if prev < cur {
            res += (cur - prev - prev)
            // minus prev one twice,
            // one time has been add to res
            // one time has contained by cur
        } else {
            res += cur
        }
        index += 1
    }
    return res
}

private func mapRomanToInt(_ s: String) -> Int {
    
    switch s {
        case "I": return 1
        case "V": return 5
        case "X": return 10
    default: return 0
    }
}


let roman = "IV"
let resRoman = romanToInteger(str: roman)






