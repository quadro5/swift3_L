//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func sortColors(_ nums: inout [Int]) {
        if nums.count < 2 {
            return
        }
        let len = nums.count
        var start = 0
        var end = len - 1
        var index = 0
        
        while index <= end {
            if nums[index] == 0, index != start {
                swap(&nums[index], &nums[start])
                //index += 1
                start += 1
            } else if nums[index] == 2, index != end {
                swap(&nums[index], &nums[end])
                end -= 1
            } else {
                index += 1
            }
        }
        return
    }
}