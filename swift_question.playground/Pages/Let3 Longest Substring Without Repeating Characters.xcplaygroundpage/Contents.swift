//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

/*
 Given a string, find the length of the longest substring without repeating characters.
 
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

*/




class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.characters.count < 2 {
            return Int(s.characters.count)
        }
        
        var used = Set<Character>()
        let array = Array(s.characters)
        let len = array.count
        
        var maxLen: Int = 0
        var index: Int = 0
        var start: Int = 0
        while index < len {
            while index < len, used.contains(array[index]) == false {
                used.insert(array[index])
                index += 1
            }
            maxLen = max(maxLen, index - start)
            
            used.remove(array[start])
            start += 1
        }
        return maxLen
    }
}


let s = "abcabcbb"
let res = Solution().lengthOfLongestSubstring(s)


