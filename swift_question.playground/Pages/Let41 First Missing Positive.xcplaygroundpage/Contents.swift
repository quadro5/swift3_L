//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

// o(n) + o(n)
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 1
        }
        var nums = nums
        let len = nums.count
        var index: Int = 0
        while index < len {
            while nums[index] > 0 && nums[index] <= len && nums[index] != nums[nums[index] - 1] {
                swap(&nums[index], &nums[nums[index]-1])
            }
            index += 1
        }
        index = 0
        while index < len {
            if index != nums[index] - 1 {
                return index + 1
            }
            index += 1
        }
        return len + 1
    }
}