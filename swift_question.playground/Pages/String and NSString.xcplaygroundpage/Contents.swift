


import Foundation
import UIKit



// String, transforming, map/flatMap

let strArrayMap = ["12😀", "abc", "11"]

// [String], returned by floatMap
let canArray1 = strArrayMap.flatMap {
    (element) in
    Int(element)
}
canArray1
// [String?], returned by map
let canArray2 = strArrayMap.map {
    (element) in
    Int(element)
}


let can1 = strArrayMap[0].unicodeScalars.map { $0.value }
can1
let isAsc = strArrayMap[0].unicodeScalars.map { $0.isASCII }
isAsc

let strToArray1 = "1234567"
let strToArray2 = strToArray1.characters.map { String($0) }
strToArray2

// NSString

/*
字符串比较
NSString *str =@"abc";
NSString *str2 = @"ADC";
NSComparisionResult res = [str1 compare:str2];
// NSOrderedAscending / NSOrderedDescending / NSOrderedSame
res = [str1 compare:str2 options:NSCaseInsensitiveSearch];
*/


// 字符串比较
let str1 = "abc"
let str2 = "abd"

if str1 > str2 {
    print("str1 > str2")
} else if str1 == str2 {
    print("str1 == str2")
} else {
    print("str1 < str2")
}


/*
字符串拼接
NSString *str =@"abc";
NSString *str2 = @"ADC";
NSString* res = [str stringByAppendingString:str2];
// res = @"abcADC"
*/

// 字符串拼接
let sum1 = str1 + str2;
let sum2 = str2 + str1;


/*
字符串内容比较(upper lower case sensitive)
[str0 isEqualToString:str1]
*/
if str1 == str2 {
    print("str1 == str2")
}

/*
字符串前后缀检查 prefix
NSString*url = @"http://www.fb.com/1.png";
BOOL isAddress = [url hasPrefix:@"http://"];
BOOL isImage = [url hasSuffix:@"png"];
*/
let urlStr = "http://www.fb.com/1.png"
let isAddress = urlStr.hasPrefix("http://")
let isImage = urlStr.hasSuffix("1.png")



 
/*
字符串查找
//首次出现的位置: RangeOfString
//返回值：NSRange (location, length)
//找不到用length 是否为0判断，因为找不到location返回NSNotFound
NSString* str1 = @"abc";
NSString* str2 = @"ereabcc";
NSRange index = [str2 rangeOfString:str1];
NSLog(@"%zd, %zd", index.location, index.length)；

//NSRange:
NSRange range = NSMakeRange(5, 4);

//NSRange 转换为字符串
NSString* str = NSStringFromRange(range);
*/
let search1 = "abc"
let search2 = "erabcc"
let index = search2.range(of: search1)
print("index: \(index!.lowerBound) \(index!.upperBound)\n")
// 2..<5

let left = search2.index(search2.startIndex, offsetBy: 2)
let right = search2.index(search2.startIndex, offsetBy: 5)
let range = left..<right // String.Idnex with 2..<5
let rangeRes = search2.substring(with: range) // "abc" with index 234



/*
字符串截取
(NSString *)substringFromIndex:(NSUInteger)from; 从指定位置from开始(包括
指定位置的字符)到尾部

(NSString *)substringToIndex:(NSUInteger)to; 从字符串的开头一直截取到指
定的位置to,但不包括该位置的字符

(NSString *)substringWithRange:(NSRange)range; 按照所给出的NSRange从
字符串中截取子串
NSString *url = @"http://www.facebook.com";

NSLog(@"%@", [url substringFromIndex:7]);
// www.facebook.com
NSLog(@"%@", [url substringToIndex:7]);
// http:/
NSRange range = NSMakeRange(11, 8);

NSLog(@"%@", [url substringWithRange:range]); // facebook
*/

let url = "http://www.facebook.com"
let hostIndex = url.index(url.startIndex, offsetBy: 7)
let host = url.substring(from: hostIndex)

let headIndex = url.index(url.startIndex, offsetBy: 7)
let head = url.substring(to: headIndex)



/*
字符串替换
NSString* str ="abc-dcb";
str = [str stringByReplacingOccurrencesOfString:@"-" withString:@"."];
*/

var strReplace = "abc-abc"
let resReplace = strReplace.replacingOccurrences(of: "-", with: ".")

let left1 = strReplace.index(strReplace.startIndex, offsetBy: 4)
let right1 = strReplace.index(strReplace.startIndex, offsetBy: 7)
let range1 = left1..<right1
let resReplace1 = strReplace.replacingCharacters(in: range1, with: "ddddef")
let resReplace2 = strReplace.replacingOccurrences(of: "a", with: "def", options: .backwards, range: range1)

/*
字符串分割
//定义字符串
NSString*str =@"400-588-1688";
NSArray *arr = [str componentsSeparatedByString:@"-"];
NSLog(@"%@",arr);
*/

let strCut = "400-588-1688"
let resCut = strCut.components(separatedBy: "8")
let resCut1 = strCut.components(separatedBy: ["-", "."])



/*
类名转字符串
NSStringFromClass([xxx class]);
*/
class TestClass {
    init() {
        print("I am TestClass init")
    }
}
let classNameFromClass = NSStringFromClass(type(of: TestClass()))
let classNameFromClass1 = NSStringFromClass(TestClass.self)
print("className: \(classNameFromClass)\n")


/*
字符串转类型
NSClassFromString(@"UIApplication");
*/
if let classFromString = NSClassFromString("UIApplication") {
    print("UIApp: \(classFromString)\n")
}

if let classFromString = NSClassFromString("TestClass") as? TestClass.Type {
    print("UIApp: \(classFromString)\n")
}


/*
字符串其他用法
//获取字符 及 ASCII
NSString *str ="abc";
unichar c = [str characterAtIndex:i];
int i = c;

//字符串转整型
//intValue, floatValue, doubleValue
NSString *str =@"-123";
NSInteger num = [str intValue];//-123
*/

let str = "abcd0123😀"
let strArray = Array(str.characters)
let utf8Array = Array(str.utf8) // Array<String.UTF8View._Element>
let utf16Array = Array(str.utf16) // Array<String.UTF16View._Element>
let unicodeArray = Array(str.unicodeScalars) // Array<String.UnicodeScalarView.Iterator.Element>


let utf8ArrayTest: Array<String.UTF8View._Element> = Array(str.utf8)


// view
let characters = str.characters
let utf8View = str.utf8
let utf16View = str.utf16
let unicodeScalarsView = str.unicodeScalars

// geting the asc code / asc code difference
let ascCodeInt = Int(utf8Array[1])
let ascCodeDiff = Int(utf8Array[1] - utf8Array[0])

// change back to String
let strRetrive1 = String(strArray)
let strRetrive2 = String(utf8View)

// change type
let number = 11
let numberStr = String(number)
let numberStr1 = 0-0-011
let numberRetrive = Int(numberStr1)









