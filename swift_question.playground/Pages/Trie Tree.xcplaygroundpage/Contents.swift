

// DoubleListNode
class DoubleListNode<T> {
    typealias Element = T
    
    var val: Element
    
    weak var prev: ListNode<Element>?
    var next: ListNode<Element>?
    /*
     cannot add this
     without val pass-in, we cannot refer the type
     init() {
     self.val = Element()
     self.next = nil
     }
     */
    init(val: Element) {
        self.val = val
        self.prev = nil
        self.next = nil
    }
}











// ListNode
class ListNode<T> {
    typealias Element = T
    
    var val: Element
    var next: ListNode<Element>?
    /* 
    cannot add this
    without val pass-in, we cannot refer the type
    init() {
        self.val = Element()
        self.next = nil
    }
    */
    init(val: Element) {
        self.val = val
        self.next = nil
    }
}

let listnode1 = ListNode(val: 1)
listnode1.next = ListNode(val: 2)
listnode1.val
let secListNode = listnode1.next?.val


// using Enum
class Node<T> {
    let value: T?
    let next: Node<T>?
    init(value: T?, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}
// 单向链表：1 -> 2 -> 3 -> 4
indirect enum LinkedList<Element: Comparable> {
    case empty
    case node(Element, LinkedList<Element>)
    
    func removing(_ element: Element) -> LinkedList<Element> {
        guard case let .node(value, next) = self else {
            return .empty
        }
        return value == element ?
            next : LinkedList.node(value, next.removing(element))
    }
}
let linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))
// 单项链表：1 -> 2 -> 3 -> 4
/* 
 在 enum 的定义中嵌套⾃⾝对于 class 这样的引⽤类型来说没有任何问题，
 但是对于像 struct 或者enum 这样的值类型来说，普通的做法是不可⾏的.
 我们需要在定义前⾯加上 indirect 来提⽰编译器
 不要直接在值类型中直接嵌套。⽤ enum 表达链表的好处在于，
 我们可以清晰地表⽰出空节点这⼀定义，
*/
let result = linkedList.removing(2)
print(result)
// 1 -> 3 -> 4





// TreeNode
class TreeNode {
    var val: Int
    
    weak var parent: TreeNode?
    var left: TreeNode?
    var right: TreeNode?
    init() {
        self.val = 0
        
        self.parent = nil
        self.left = nil
        self.right = nil
    }
    init(val: Int) {
        self.val = val
        
        self.parent = nil
        self.left = nil
        self.right = nil
    }
}


// TrieNode
class TrieNode {
    var isWord: Bool
    var word: String? // for one time search recording
    var next: Array<TrieNode?>
    init() {
        self.isWord = false
        self.word = nil
        self.next = Array<TrieNode?>(repeating: nil, count: 26)
    }
}




















