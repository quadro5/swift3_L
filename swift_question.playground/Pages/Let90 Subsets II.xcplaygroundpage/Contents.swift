//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = Array<Array<Int>>()
        if nums.isEmpty {
            return res
        }
        var nums = nums.sorted()
        helper(nums: &nums, res: &res, row: [Int](), index: 0)
        return res
    }
    
    private func helper(
        nums: inout [Int],
        res: inout [[Int]],
        row: [Int],
        index: Int
        ) {
        
        res.append(row)
        let len = nums.count
        var rowVar = row
        var i = index
        while i < len {
            if i > index, nums[i-1] == nums[i] {
                i += 1
                continue
            }
            rowVar.append(nums[i])
            helper(nums: &nums, res: &res, row: rowVar, index: i+1)
            rowVar.removeLast()
            i += 1
        }
    }
}