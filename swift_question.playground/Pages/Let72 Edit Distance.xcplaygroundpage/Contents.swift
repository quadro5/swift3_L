//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.isEmpty {
            return word2.characters.count
        }
        let w1 = word1.characters.map { String($0) }
        let w2 = word2.characters.map { String($0) }
        let w1Len = w1.count
        let w2Len = w2.count
        // recording min count
        var dp = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: w2Len+1), count: w1Len+1)
        dp[0][0] = 0
        var i = 0
        while i < w1Len + 1 {
            var j = 0
            while j < w2Len + 1 {
                // add
                if i == 0 {
                    dp[i][j] = j
                    // add
                } else if j == 0 {
                    dp[i][j] = i
                } else {
                    // repalce
                    let replace = dp[i-1][j-1] + (w1[i-1] == w2[j-1] ? 0 : 1)
                    // add or delete
                    let add = min(dp[i-1][j], dp[i][j-1]) + 1
                    dp[i][j] = min(replace, add)
                }
                j += 1
            }
            i += 1
        }
        return dp[w1Len][w2Len]
    }
}


let res = Solution().minDistance("abc", "ab")

