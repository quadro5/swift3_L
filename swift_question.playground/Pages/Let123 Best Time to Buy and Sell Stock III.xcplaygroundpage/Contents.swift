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
        
        // forward Buy
        var forwardProfit = Array<Int>(repeating: 0, count: len)
        var firstBuyMin = prices[0]
        var i = 1
        while i < len {
            forwardProfit[i] = max(forwardProfit[i-1], prices[i] - firstBuyMin)
            firstBuyMin = min(firstBuyMin, prices[i])
            i += 1
        }
        
        // backward sell
        var maxProfit: Int = 0
        var secondSellMax = prices[len-1]
        var secondMaxProfit = 0
        var j = len - 2
        while j >= 0 {
            secondMaxProfit = max(secondMaxProfit, secondSellMax - prices[j])
            secondSellMax = max(secondSellMax, prices[j])
            maxProfit = max(maxProfit, secondMaxProfit + forwardProfit[j])
            j -= 1
        }
        return maxProfit
    }
}