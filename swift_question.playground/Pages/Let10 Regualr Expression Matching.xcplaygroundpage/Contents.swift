//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
         if s.isEmpty, p.isEmpty{
             return true
         }
        let base = String(".*").utf8.map { Int($0) }
        let ss = s.utf8.map { Int($0) }
        let pp = p.utf8.map { Int($0) }
        let slen = ss.count
        let plen = pp.count
        // dp[slen][plen]
        var dp = Array<Array<Bool>>(
            repeating: Array<Bool>(repeating: false, count: plen+1), count: slen+1)
        dp[0][0] = true
        var i = 0 // aa VS a*, we need true
        while i < slen + 1 {
            var j = 1
            while j < plen + 1 {
                // for "*"
                if pp[j-1] == base[1] {
                    // a VS aa*, a* repeat 0, so we use i and j-2
                    // aaaa VS aa*, a* repeat > 0, so we test i-1(prev) to j(current)
                    dp[i][j] = dp[i][j-2]
                        || (i > 0 && dp[i-1][j] && (ss[i-1] == pp[j-2] || pp[j-2] == base[0]))
                    // for normal letters and "."
                } else {
                    dp[i][j] = i > 0 && dp[i-1][j-1]
                        && (ss[i-1] == pp[j-1] || pp[j-1] == base[0])
                }
                j += 1
            }
            i += 1
        }
        return dp[slen][plen]
    }
}

let res = Solution().isMatch("a", "a")

