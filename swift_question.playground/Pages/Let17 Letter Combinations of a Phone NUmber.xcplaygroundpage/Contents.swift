//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



/// Version 1, recurrsion
/// add press dict,
/// keep row as the last result, every time press, we append the last result
/// once the press is finish, we add the result into res
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return Array<String>()
        }
        var nums = Array(digits.utf8)
        var res = Array<String>()
        //let len = digits.count
        var dict = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
        helper(nums: &nums, res: &res, dict: &dict, row: "", index: 0)
        return res
    }
    
    private func helper(
        nums: inout Array<String.UTF8View._Element>,
        res: inout [String],
        dict: inout [String],
        row: String,
        index: Int) -> Void {
        
        if index == nums.count {
            res.append(row)
            return
        }
        // if pressInt: 2 .. 9
        if let pressInt = toInt(ch: nums[index]) {
            let pressStr = dict[pressInt]
            for ch in pressStr.characters {
                var rowNew = row
                rowNew.append(ch)
                helper(nums: &nums, res: &res, dict: &dict, row: rowNew, index: index + 1)
            }
        // if pressInt is nil
        } else {
            helper(nums: &nums, res: &res, dict: &dict, row: row,index: index + 1)
        }
    }
    
    private func toInt(ch: String.UTF8View._Element) -> Int? {
        let baseStr = "09"
        let baseArray = Array(baseStr.utf8)
        let diff = Int(ch - baseArray[0])
        if diff < 1 || diff > 9 {
            return nil
        }
        return diff
    }
}


/// Version2
class Solution2 {
    func letterCombinations(_ digits: String) -> [String] {
        var res = Array<String>()
        if digits.isEmpty {
            return res
        }
        let keys = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        
        res.append("")
        let characters = digits.characters.map {
            String($0)
        }
        for character in characters {
            guard let str = keys[character] else {
                break
            }
            
            // [String?], returned by map
            let candidates = str.characters.map {
                String($0)
            }
            var curRes = Array<String>()
            for candidate in candidates {
                for lastRes in res {
                    curRes.append(lastRes + candidate)
                }
            }
            res = curRes
        }
        
        return res
    }
}




