//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        let len = nums.count
        var maxSum = Int.min
        var curSum = 0
        var index = 0
        
        while index < len {
            // whether we can add current value to extend window
            // or we current value is the local largest
            curSum = max(nums[index], curSum + nums[index])
            maxSum = max(maxSum, curSum)
            index += 1
        }
        return maxSum
    }
}