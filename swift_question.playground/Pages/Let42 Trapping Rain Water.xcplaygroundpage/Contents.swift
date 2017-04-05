//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/// Version 1, one pass
///
class Solution {
    func trap(_ height: [Int]) -> Int {
        if height.count < 3 {
            return 0
        }
        let len = height.count
        var waterMax: Int = 0
        var startMax =  height[0]
        var endMax = height[len-1]
        var start = 1
        var end = len - 2
        // for testcase [2, 0, 2], we start == end
        while start <= end {
            startMax = max(startMax, height[start])
            endMax = max(endMax, height[end])
            if startMax < endMax {
                waterMax += startMax - height[start]
                start += 1
            } else {
                waterMax += endMax - height[end]
                end -= 1
            }
        }
        return waterMax
    }
}


/// Version 2, two pass
///
class Solution2 {
    func trap(_ height: [Int]) -> Int {
        if height.count < 2 {
            return 0
        }
        let len = height.count
        var waterMax: Int = 0
        var maxHeight: Int = 0
        var maxIndex: Int = 0
        // find highest
        for i in 0..<len {
            if height[i] <= maxHeight {
                continue
            }
            maxHeight = height[i]
            maxIndex = i
        }
        // forward
        var forwardMax = height[0]
        var start: Int = 0
        while start < maxIndex {
            if forwardMax > height[start] {
                waterMax += forwardMax - height[start]
            } else {
                forwardMax = height[start]
            }
            start += 1
        }
        // backward
        var backwardMax = height[len-1]
        var end = len - 1
        while end > maxIndex {
            if backwardMax > height[end] {
                waterMax += backwardMax - height[end]
            } else {
                backwardMax = height[end]
            }
            end -= 1
        }
        return waterMax
    }
}
