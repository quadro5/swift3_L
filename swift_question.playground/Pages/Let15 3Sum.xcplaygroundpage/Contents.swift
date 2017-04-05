//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var res = Array<Array<Int>>()
        if nums.count < 3 {
            return res
        }
        var array = nums.sorted()
        var rest: Int = 0
        let len = array.count
        for i in 0..<len-2 {
            
            // purning, min >0
            if array[i] + array[i+1] + array[i+2] > 0 {
                break
            }
            // purning, max < 0
            if array[i] + array[len-2] + array[len-1] < 0 {
                continue
            }
            // de dup
            if i > 0, array[i-1] == array[i] {
                continue;
            }
            rest = 0 - array[i]
            var start = i + 1
            var end = len - 1
            while start < end {
                // dedup
                if start > i + 1, array[start] == array[start-1] {
                    start += 1
                    continue;
                }
                if array[start] + array[end] > rest {
                    end -= 1
                } else if array[start] + array[end] < rest {
                    start += 1
                } else {
                    let row = Array<Int>([array[i], array[start], array[end]])
                    res.append(row)
                    end -= 1
                    start += 1
                }
            }
        }
        return res
    }
}