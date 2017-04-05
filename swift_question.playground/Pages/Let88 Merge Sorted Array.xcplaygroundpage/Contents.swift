//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Solution {
    func merge2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        var index = m + n - 1
        var indexNum1 = m - 1
        var indexNum2 = n - 1
        while index >= 0 {
            //nums1[index] = nums1[indexNum1] > nums2[indexNum2] ? nums1[indexNum1] : nums2[indexNum2]
            if indexNum1 >= 0, indexNum2 >= 0 {
                if nums1[indexNum1] > nums2[indexNum2] {
                    nums1[index] = nums1[indexNum1]
                    indexNum1 -= 1
                } else {
                    nums1[index] = nums2[indexNum2]
                    indexNum2 -= 1
                }
            } else if indexNum1 >= 0 {
                nums1[index] = nums1[indexNum1]
                indexNum1 -= 1
            } else {
                nums1[index] = nums2[indexNum2]
                indexNum2 -= 1
            }
            index -= 1
        }
    }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index = m + n - 1
        var indexNum1 = m - 1
        var indexNum2 = n - 1
        
        // replace x > y ? ... : ...;
        func calculate(index1: inout Int, index2: inout Int) -> Int {
            var res = 0
            if nums1[indexNum1] > nums2[indexNum2] {
                res = nums1[indexNum1]
                indexNum1 -= 1
                return res
            }
            res = nums2[indexNum2]
            indexNum2 -= 1
            return res
        }
        
        
        while index >= 0 {
            if indexNum1 >= 0, indexNum2 >= 0 {
                nums1[index] = calculate(index1: &indexNum1, index2: &indexNum2)
            } else if indexNum2 >= 0 {
                nums1[index] = nums2[indexNum2]
                indexNum2 -= 1
            }
            index -= 1
        }
    }
}