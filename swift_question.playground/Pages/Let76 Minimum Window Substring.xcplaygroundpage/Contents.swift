//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/// Version 1
/// using Set<>, recording appearance of t
class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        if t.isEmpty || s.isEmpty {
            return ""
        }
        //var res = ""
        let ss = s.characters.map { String($0) }
        let tt = t.characters.map { String($0) }
        let slen = ss.count
        //let tlen = tt.count
        //
        var minStart = 0
        var minLen = Int.max
        var dict = Dictionary<String, Int>()
        var count = 0
        var index = 0
        var start = 0
        // add tt in to Dict
        for str in tt {
            if dict[str] == nil {
                dict[str] = 1
            } else {
                dict[str]! += 1
            }
        }
        count = dict.count
        while start < slen {
            // get the end point
            while index < slen, count != 0 {
                if dict[ss[index]] != nil {
                    dict[ss[index]]! -= 1
                    if let num = dict[ss[index]], num == 0 {
                        count -= 1
                    }
                }
                index += 1
            }
            //index -= 1
            
            // get the range
            if count == 0, index - start < minLen {
                minLen = index - start
                minStart = start
            }
            // handle start
            if dict[ss[start]] != nil {
                if dict[ss[start]]! == 0 {
                    count += 1
                }
                dict[ss[start]]! += 1
            }
            start += 1
            //index += 1
        }
        // test t contains s
        if minLen == Int.max {
            return ""
        }
        // get min substring
        let leftBoundary = s.index(s.startIndex, offsetBy: minStart)
        let rightBoundary = s.index(s.startIndex, offsetBy: minStart+minLen)
        let range = leftBoundary..<rightBoundary
        return s.substring(with: range)
    }
}



/// Version 2, 
/// use array recording the appearance of all letter of s
class Solution2 {
    func minWindow(_ s: String, _ t: String) -> String {
        if s.isEmpty || t.isEmpty {
            return ""
        }
        let ss = s.utf8.map { Int($0) }
        let tt = t.utf8.map { Int($0) }
        let slen = ss.count
        // recording appearance of t
        // [key] > 0 is belong to t
        // [key] < 0 is belong to s without t
        var dict = Array<Int>(repeating: 0, count: 128)
        var count = tt.count // recording t.length()
        var start = 0
        var index = 0
        var minStart = 0
        var minLen = Int.max
        for ascNum in tt {
            dict[ascNum] += 1
        }
        while index < slen {
            // get most right range
            if dict[ss[index]] > 0 {
                count -= 1
            }
            dict[ss[index]] -= 1
            // recording any substring including t
            while count == 0 {
                // update min substring
                if index - start + 1 < minLen {
                    minLen = index - start + 1
                    minStart = start
                }
                // from front to reduce the window size
                dict[ss[start]] += 1
                if dict[ss[start]] > 0 {
                    count += 1
                }
                start += 1
            }
            index += 1
        }
        if minLen == Int.max {
            return ""
        }
        let leftCorner = s.index(s.startIndex, offsetBy: minStart)
        let rightCorner = s.index(s.startIndex, offsetBy: minStart + minLen)
        let range = leftCorner..<rightCorner
        return s.substring(with: range)
    }
}


