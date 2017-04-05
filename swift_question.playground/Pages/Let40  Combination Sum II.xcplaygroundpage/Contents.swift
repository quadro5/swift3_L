//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = Array<Array<Int>>()
        if candidates.isEmpty {
            return res
        }
        var nums = candidates.sorted()
        helper(nums: &nums, res: &res, row: [Int](), target: target, index: 0)
        return res
    }
    private func helper(
        nums: inout [Int],
        res: inout [[Int]],
        row: [Int],
        target: Int,
        index: Int) -> Void {
        
        if target == 0 {
            res.append(row)
            return
        }
        if index == nums.count {
            return
        }
        
        var i: Int = index
        let len: Int = nums.count
        var newRow = row
        while i < len {
            let rest = target - nums[i]
            if rest < 0 {
                break
            }
            if i > index, nums[i-1] == nums[i] {
                i += 1
                continue
            }
            newRow.append(nums[i])
            helper(nums: &nums, res: &res, row: newRow, target: rest, index: i+1)
            newRow.removeLast()
            i += 1
        }
    }
}


let nums = [10,1,2,7,6,1,5]
let target = 8

let res = Solution().combinationSum2(nums, target)

print("res: \n\(res)")
