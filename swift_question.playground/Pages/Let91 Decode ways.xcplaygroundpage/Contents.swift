//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/// Version 1, roll array
class Solution {
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let base = String("0").utf8.map { Int($0) }
        let strs = s.utf8.map { Int($0) - base[0] }
        let len = strs.count
        var cur = 1
        var prev = 0
        var i = 0
        while i < len {
            // for 0
            if strs[i] == 0 {
                cur = 0
            }
            // for 11--26
            if i > 0 && ((strs[i-1] != 0 && strs[i-1] < 2) || (strs[i-1] == 2 && strs[i] < 7)) {
                cur = prev + cur
                prev = cur - prev
                // other single num
            } else {
                prev = cur
            }
            i += 1
        }
        return cur
    }
}




/// Version 2 DP
class Solution2 {
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        let base = String("0").utf8.map { Int($0) }
        let strs = s.utf8.map { Int($0) - base[0] }
        let len = strs.count
        var dp = Array<Int>(repeating: 0, count: len+1)
        dp[0] = 1
        var i = 1
        while i < len + 1 {
            // for 0
            if strs[i-1] == 0 {
                dp[i-1] = 0
            }
            // for 11--26
            if i > 1 && ((strs[i-2] != 0 && strs[i-2] < 2) || (strs[i-2] == 2 && strs[i-1] < 7)) {
                //cur = prev + cur
                //prev = cur - prev
                dp[i] = dp[i-2] + dp[i-1]
                // other single num
            } else {
                //prev = cur
                dp[i] = dp[i-1]
            }
            i += 1
        }
        return dp[len]
    }
}



