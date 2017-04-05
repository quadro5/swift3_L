//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // index: x
        // value: y
        if height.count < 2 {
            return min(height[0], height[1])
        }
        let len = height.count
        var maxWater: Int = 0
        var start: Int = 0
        var end: Int = len - 1
        while start < end {
            let minHeight = min(height[start], height[end])
            maxWater = max(maxWater, (end-start) * min(height[start], height[end]))
            // if start is the min, need to update
            while start < end && height[start] <= minHeight {
                start += 1
            }
            
            // if end is the min, need to update
            while start < end && height[end] <= minHeight {
                end -= 1
            }
        }
        return maxWater
    }
}

//let res = Solution().maxArea([1, 2, 3, 4])
//print("res = \(res)")



