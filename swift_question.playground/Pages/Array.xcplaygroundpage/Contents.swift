//: [Previous](@previous)

import Foundation
import UIKit

//: [Next](@next)


/*
 Objective C
只能存放对象，
不能存放基本数据类型：int float double char enum struct
不能存放nil(用[NSNULL null]替代)
*/
 
// Swift
let intArray = Array<Int>()
let floatArray = Array<Float>()
let cgFloatArray = Array<CGFloat>()
let charArray = Array<CChar>()
// for enum
enum TestEnum { case test0 }
let enumArray = Array<TestEnum>()
// for struct
let cgpointArray = Array<CGPoint>()
let cgrectArray = Array<CGRect>()

/*
 for multiple layer
 
*/
let dictArray = Array<Dictionary<String, String>>()
var array3 = Array<Array<Array<Int>>>()
var array2 = Array<Array<Int>>()
var array1 = Array<Int>()
array1.append(1)
array2.append(array1)
array3.append(array2)
array3[0][0][0]

array1.insert(1, at: 0)
array1.insert(contentsOf: [2, 2], at: 0)

array1.insert(3, at: 4)



/*
  sorting
*/
// This code sorts an array of names alphabetically and looks complicated. Simplify it and the closure as much as you can.
let animals = ["fish", "cat", "chicken", "dog"]
let sortedAnimals = animals.sorted { (one: String, two: String) -> Bool in
    return one < two
}
// type inference system can calculate the type of the parameters in the closure
let mod1 = animals.sorted {
    (one, two) -> Bool in
    return one < two
}
// return type can be inferred
let mod2 = animals.sorted {
    (one, two) in
    return one < two
}
// $i notation can substitute the parameter names
let mod3 = animals.sorted {
    return $0 < $1
}
// In single statement closures, the return keyword can be omitted. The return value of the last statement becomes the return value of the closure:
let mod4 = animals.sorted { $0 < $1 }
mod4








/*
//获取对象
NSLog(@"%@", [arr2 objectAtIndex:2]);
NSLog(@"%@", arr2[5]);
*/
var elementArray = [1.1, 2.2, 3.3, 4.4, 5.5]
var forwardProfit = Array<Int>(repeating: 0, count: 10)
let getElement1 = elementArray[1]
// let getElement2 = elementArray[5]

elementArray
if var first = elementArray.first {
    first = 0.1
}
elementArray
if var last = elementArray.last {
    last = 0.1
}
elementArray

class classElement {
    var hehe = 1
    init(_ value: Int) {
        self.hehe = value
    }
    init() {
        self.hehe = 1
    }
}

var classArray = [classElement(),classElement()]
if let firstClass = classArray.first {
    firstClass.hehe = 100
}
classArray
if let lastClass = classArray.last {
    lastClass.hehe = 100
}
classArray



// 操作对象
let popLast = elementArray.popLast() // pop_back return Ele?
let popFirst = elementArray.remove(at: 0) // pop_front reutrn Ele?

elementArray.insert(0.1, at: 0) // insert at front
elementArray.append(6.1) // push_back

elementArray.sort()
let sortedElementArray = elementArray.sorted()


/*
//获取位置,没有反回NSNotFound
NSLog(@"%zd", [arr2 indexOfObject:@2]);
if ([arr2 indexOfObject:@33] == NSNotFound) {
    NSLog(@"nothing");
}
*/
let getIndex1 = elementArray.index(of: 2)
let getIndex2 = elementArray.index(of: 2.2)

/*
//是否包涵
if ([arr2 containsObject:@2]) {
    NSLog(@"确实包涵2");
}
*/
if elementArray.contains(6.6) == true{
    print("Find 6.6 in elementArray/n")
} else {
    print("Cannot find 6.6 in elementArray/n")
}

//firstObject, lastObject
let first = elementArray.first
let last = elementArray.last
 
/*
数组存放字典
*/
let arrayCreate = [1, 2, 3, 4]
let dictCreate = [1:1, 2:2]
let arrayDict = [
    [1:1, 2:2],
    [3:3, 4:4]
]



/*
遍历

三种方式：

普通循环

快速枚举: for (NSString* str in arr) {}

block: enumUsingWithBlock();

//NSArray
NSArray *arrData = @[@1,@2,@3,@4];

// 1.Classical
for (int i=0; i< [arrData count]; i++){
    NSLog(@"[%d]:%@",i,arrData[i]);
}

// 2.Fast iteration
for (id element in arrData){
    NSLog(@"%@",element);
}

// 3.Blocks
[arrData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSLog(@"[%lu]:%@",idx,obj);
    // Set stop to YES in case you want to break the iteration
    }];
 */
let arrayTraversal = [1, 2, 3, 4, 5, 6, 7]
let len = arrayTraversal.count

for index in 0..<len {
    let hehe = arrayTraversal[index]
}

arrayTraversal.forEach { (element) in
    let hehe = element
}

for element in arrayTraversal {
    let hehe = element
}


 
/*
数组读写文件

//创建一个数组
NSArray *arr = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
//写入数据到文件中
if ([arr writeToFile:@"/Users/liwei/Desktop/arr.plist" atomically:YES]) {
    NSLog(@"写入成功!");
}

//创建一个数组,读取xml文件

NSArray *arr = [NSArray arrayWithContentsOfFile:@"/Users/liwei/D
esktop/arr.xml"];
NSLog(@"%@",arr);

//创建一个数组,读取plist

NSArray *arr = [NSArray arrayWithContentsOfFile:@"/Users/liwei/D
esktop/arr.plist"];
NSLog(@"%@",arr);
*/



 
 
/*
数组冒充字典：
//初始化
NSMutableArray *dict = [NSMutableArray array];
NSMutableArray *nums = [numbers mutableCopy];

//新增
[dict addObject:@(-1)]

//移除
[dict removeObject:@(2)];

//插入元素
[arryM insertObject:@"AOL" atIndex:1];

//交换
[nums exchangeObjectAtIndex:i withObjectAtIndex:j];

//第一个，最后一个
firstObject lastObject

//排序
[unsortArr sortedArrayUsingSelector:@selector(compare:)];

//遍历数组
for (id num in dict) {
    [res addObject:num];
}
*/

// 数组冒充字典
var nums = Array<Int>()
nums.capacity
nums.reserveCapacity(2)
nums.capacity
nums.count

nums.append(-1)
nums.append(contentsOf: [1, 2, 3])
nums.append(4)


let remove0 = nums.remove(at: 0)
nums.insert(111, at: 0) // insert at 0, and rest move afterward
nums.insert(222, at: 1) // insert at 1, and rest move afterward
nums.removeAll(keepingCapacity: true)
nums.removeAll()

// swap
public extension Array {
    mutating func swap(_ index1: Int, _ index2: Int) {
        let temp: Element = self[index1]
        self[index1] = self[index2]
        self[index2] = temp
    }
}

func mySwap<T>(_ left: inout T, _ right: inout T) {
    (left, right) = (right, left)
}

var swapNums = [1, 2, 3, 4, 5, 6, 7]
swapNums.swap(0, 2)
swap(&swapNums[0], &swapNums[2])
swapNums
(swapNums[0], swapNums[2]) = (swapNums[2], swapNums[0])
swapNums
mySwap(&swapNums[0], &swapNums[2])
swapNums





