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
        var i = 1
        while i < len {
            if prices[i] > prices[i-1] {
                maxProfit += prices[i] - prices[i-1]
            }
            i += 1
        }
        return maxProfit
    }
}