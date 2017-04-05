//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


extension Array {
    func shuffle() -> Array {
        var res = self
        let count = res.count
        if count < 2 {
            return res
        }
        for index in 0..<count - 1 {
            let resCount = count - index
            let exchangeIndex = index + Int(arc4random_uniform(UInt32(resCount)))
            swap(&res[index], &res[exchangeIndex])
        }
        return res
    }
}

/*
 把每个数等概率的放到任何一个位置 每一个位置等概率的得到某个值。
 similar with n persons lottery n ticket(number from 1~n) for each person, it's equal probability to get any ticket number
 来计算一下概率。如果某个元素被放入第i（1≤i≤n1≤i≤n ）个位置，
 就必须是在前i - 1次选取中都没有选到它，并且第i次选取是恰好选中它。
 其概率为： pi=n−1/n × n−2/n−1 ×⋯× n−i+1/n−i+2 × 1/n−i+1 = 1/n
*/

func shuffle(nums: [Int]) -> [Int] {
    var nums = nums
    let count = nums.count
    if count < 2 {
        return nums
    }
    for index in 0..<count - 1 {
        let restCount = count - index
        let exchangeIndex = index + Int(arc4random_uniform(UInt32(restCount)))
        
        if index != exchangeIndex {
            swap(&nums[index], &nums[exchangeIndex])
        }
        
    }
    return nums
}

let nums = [1, 2, 3, 4, 5, 6]

let res = shuffle(nums: nums)








// 这个改良版本接受⼀个 UInt32 的数字 n 作为输⼊，将结果归⼀化到 0 到 n - 1 之间。只要我们的输⼊不超过 Int 的范围，就可以避免危险的转换：
let diceFaceCount: UInt32 = 6
let randomRoll = Int(arc4random_uniform(diceFaceCount)) + 1
//print(randomRoll)
// 最佳实践当然是为创建⼀个 Range 的随机数的⽅法，这样我们就能在之后很容易地复⽤，甚⾄设计类似与 Randomable 这样的协议了：
func random(in range: Range<Int>) -> Int {
    let count = UInt32(range.upperBound - range.lowerBound)
    return Int(arc4random_uniform(count)) + range.lowerBound
}
for _ in 0...2 {
    let range = Range<Int>(1...6)
    print(random(in: range))
}



Int.max
Int64.max
Int32.max
UInt32.max


let testInt: Int64 = 9223372036854775807
if testInt > Int64(UInt32.max) {
    print("more than UInt32.max")
} else {
    print("less than UInt32.max")
}


// 3 Random max index
/*
equal probability
可以用Reservoir Sampling 不需要额外space
如果被选中则会替换res结果。 所以被须满足当前点选中，后面点都不中才可以满足条件。
假设元素为i，则被选中的概率为：
1/i i/(i+1) i+1)/(i+2)* ... (n-1)/n = 1/n;

//给一个全是数字的数组，随机返回0到当前位置中最大值得坐标
//比如【1,2,3,3,3,3,1,2】
//在最后一个2的时候有4个3都是最大值，要按1/4的概率返回其中一个3的index
//[1, 2, 3, 3, 3, 3]
*/
func random_max(nums: [Int]) -> Int {
    var res = 0
    var count = 0
    var max = Int.min
    for i in 0..<nums.count {
        // keep tracking max value
        if nums[i] > max {
            max = nums[i]
            count = 1
            res = i
        // if max value more than one
        } else if nums[i] == max {
            count += 1
            if Int(arc4random()) % count == 0 {
              res = i;
            }
        }
    }
    return res
}










