//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        let len = prices.count
        var maxProfit = 0
        var minBuy = prices[0]
        var i = 1
        while i < len {
            let curMax = max(maxProfit, prices[i] - minBuy)
            minBuy = min(minBuy, prices[i])
            maxProfit = max(maxProfit, curMax)
            i += 1
        }
        return maxProfit
    }
}