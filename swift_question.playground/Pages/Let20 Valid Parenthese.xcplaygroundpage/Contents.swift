//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


/// Version 1
/// if ( [ {, push_back
/// if ) ] }, try to pair with stack top,
///     if can match removeLast
///     if cannot match push_back
/// after all, if stack is empty, return true. Otherwise, false
class Solution {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var stack = [String]()
        let dict = ["(": ")", "[": "]", "{": "}"]
        let base = ["(", "[", "{"]
        let inputs = s.characters.map { String($0) }
        for input in inputs {
            // for ( [ {
            if input == base[0] || input == base[1] || input == base[2] {
                stack.append(input)
                // for ) ] }
            } else {
                if stack.isEmpty {
                    return false
                }
                if let stackTop = dict[stack.last!],
                    stackTop == input {
                    _ = stack.popLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}


/// Version 2
/// if ( [ {, push_back ) ] },
/// if ) ] } test it equals stack.top

class Solution2 {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var stack = [String]()
        let dict = ["(": ")", "[": "]", "{": "}"]
        let base = ["(", "[", "{"]
        let inputs = s.characters.map { String($0) }
        for input in inputs {
            // for ( [ {
            if input == base[0] || input == base[1] || input == base[2] {
                stack.append(dict[input]!)
                // for ) ] }
            } else {
                if stack.isEmpty || stack.removeLast() != input {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}

/// imporved Version2
class Solution3 {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var stack = [String]()
        let inputs = s.characters.map { String($0) }
        for input in inputs {
            switch input {
            // ( [ {
            case "(":
                stack.append(")")
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")
            // ) ] }
            default:
                if stack.isEmpty || stack.removeLast() != input {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
}



//Let32， longestValidParentheses
class Solution32 {
    func longestValidParentheses(_ s: String) -> Int {
        if s.characters.count < 2 {
            return 0
        }
        let base = String("()").utf8.map{ Int($0) }
        let ss = s.utf8.map { Int($0) }
        let len = ss.count
        var stk = Array<Int32>()
        // when testCase "()", i = 1, nextop = -1, maxLen = 2
        stk.append(Int32(-1))
        
        var maxLen = 0
        for i in 0..<len {
            let topValue = Int(stk.last!)
            if topValue != -1, ss[i] == base[1], ss[topValue] == base[0] {
                stk.removeLast()
                let nextTop = Int(stk.last!)
                maxLen = max(maxLen, i - nextTop)
                
            } else {
                stk.append(Int32(i))
            }
        }
        return maxLen
    }
}

let res = Solution32().longestValidParentheses("()")

