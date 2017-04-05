//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)




class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty {
            return -1
        }
        let len = nums.count
        var start = 0
        var end = len - 1
        while start + 1 < end {
            let mid = start + (end - start) / 2
            if nums[mid] == target {
                return mid
            }
            // in the left region
            if nums[mid] >= nums[start]  {
                if target <= nums[mid] && target >= nums[start] {
                    end = mid
                } else {
                    start = mid
                }
                // in the right region
            } else {
                if target >= nums[mid] && target <= nums[end] {
                    start = mid
                } else {
                    end = mid
                }
            }
        }
        if nums[start] == target {
            return start
        }
        if nums[end] == target {
            return end
        }
        return -1
    }
}