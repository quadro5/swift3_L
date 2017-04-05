//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = Array<Array<Int>>()
        if nums.isEmpty {
            return res
        }
        var nums = nums.sorted()
        var used = Set<Int>()
        helper(nums: &nums, res: &res, used: &used, row: [Int]())
        return res
    }
    
    private func helper(
        nums: inout [Int],
        res: inout [[Int]],
        used: inout Set<Int>,
        row: [Int]
        ) -> Void {
        
        if row.count == nums.count {
            res.append(row)
            return
        }
        let len = nums.count
        var i = 0
        var rowVar = row
        while i < len {
            // de-dup
            if used.contains(i) || i > 0 && nums[i-1] == nums[i] && used.contains(i-1) == false {
                i += 1
                continue
            }
            used.insert(i)
            rowVar.append(nums[i])
            helper(nums: &nums, res: &res, used: &used, row: rowVar)
            rowVar.removeLast()
            used.remove(i)
            i += 1
        }
    }
}