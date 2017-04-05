//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// getting substring
// http://stackoverflow.com/questions/39677330/how-does-string-substring-work-in-swift-3



class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.characters.count < 2 {
            return s
        }
        let array = Array(s.characters)
        let len = array.count
        var index: Int = 0
        var maxStart: Int = 0
        var maxLen: Int = 0
        while index < len {
            var start = index
            var end = index
            // run out of dup range
            while end + 1 < len, array[end] == array[end+1] {
                end += 1
            }
            // update index, jump out of dup range
            index = end + 1
            // compare abc xxxx cba,
            // start/end keep valid
            while start > 0, end + 1 < len, array[start-1] == array[end+1] {
                start -= 1
                end += 1
            }
            // cur len = end - start + 1
            if maxLen < end - start + 1  {
                maxLen = end - start + 1
                maxStart = start
            }
        }
        // leftBound  [0 + maxStart, ...)
        let leftBound = s.index(s.startIndex, offsetBy: maxStart)
        // rightBound [..., 0 + maxStart + maxLen)
        let rightBound = s.index(s.startIndex, offsetBy: maxStart + maxLen)
        let range = leftBound..<rightBound
        return s.substring(with: range)
    }
}



// let125 Valid palindrome

func isPalindrome(str: String) -> Bool {
    let len = str.characters.count
    if len < 2 {
        return true
    }
    let nums = str.characters.map { String($0) }
    var start = 0
    var end = len - 1
    
    while start <= end {
        while start < end, nums[start] == " " {
            start += 1
        }
        while start < end, nums[end] == " " {
            end -= 1
        }
        if start == end {
            return true
        } else if nums[start] != nums[end] {
            return false
        }
        start += 1
        end -= 1
    }
    return true
}

let str2 = "a b b a"
let str3 = "a    b  a"
let res = isPalindrome(str: str3)





