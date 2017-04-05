//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


// Move zero

// keep sequence of non-zero, if 0 are more
// will not keep sequence of zero
func moveZero(nums: inout [Int]) -> Int {
    if nums.count < 2 {
        return nums.count
    }
    let len = nums.count
    var left = 0
    
    for index in 0..<len {
        if nums[index] != 0 {
            if index != left {
                swap(&nums[index], &nums[left])
            }
            left += 1
        }
    }
    return left
}


var nums = [0, 0, 1, 2, 3, 0]
let res = moveZero(nums: &nums)
nums

// if 0 are less, will not keep sequence of non-zero
// will keep the sequence of zero
func moveZero2(nums: inout [Int]) -> Int {
    let len = nums.count
    if len < 2 {
        return len
    }
    
    var right = len - 1
    var index = len - 1
    while index >= 0 {
        if nums[index] == 0 {
            if index != right {
                swap(&nums[index], &nums[right])
            }
            right -= 1
        }
        index -= 1
    }
    return right + 1
}

var nums2 = [0, 0, 1, 5, 4]
let res2 = moveZero2(nums: &nums2)
nums2


