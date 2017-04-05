//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class MyClass1 {
    //weak var myClass2: MyClass2?
    var block: (() -> Void)?
    var myBlock: ((String)->())?
    var str: String?
    
    func test(completion: @escaping ((String)->())) {
        //self.myBlock = completion
        DispatchQueue.global().async {
            completion("in compleation")
        }
    }
    deinit {
        print("deinit MyClass1")
    }
}

func myTest() {
    let obj = MyClass1()
    obj.str = "yyy"
    obj.test { (res) in
        print(res)
        print(obj.str ?? "obj.str")
    }
    return
}
myTest()
// class1 -> test -> complation -> class1



// Retain cycle
class MyClass3 {
    var block: (() -> Void)?
    var str: String?
    
    // retain cycle,  self -> block -> myClass
    func test0() {
        self.block = {
            () -> Void in
            self.str = "Test 0"
        }
        self.block?()
    }
    
    // weak strong dancing
    // self -> block -> weak self -> strongSelf(weak self) inside block
    func test1() {
        self.block = { [weak weakSelf = self] () -> Void in
            weakSelf?.str = "Test 1"
        }
        self.block?()
    }
    
    // self -> block -> self -> block, then block finish, block !-> self
    func test2() {
        self.block = { () -> Void in
            self.str = "Test 2"
        }

        func hehe(with code: inout (() -> Void)?) {
            code?()
            code = nil

        }
        hehe(with: &self.block)
    }
    
    deinit {
        print("deinit MyClass3")
    }
}



func test30() {
    let class3 = MyClass3()
    class3.str
    class3.test0()
    class3.str
    //class3.block = nil
}

func test31() {
    let class3 = MyClass3()
    class3.str
    class3.test1()
    class3.str
    //class3.block = nil
}

func test32() {
    let class3 = MyClass3()
    class3.str
    class3.test2()
    class3.str
    //class3.block = nil
}




