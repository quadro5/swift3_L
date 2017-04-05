//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// Union find - model, 
// o(n) find
// o(n) union

class UnionFind1 {
    var dict = Dictionary<Int, Int>()
    /// search for top father
    ///
    /// - Parameter key: serach key
    /// - Returns: top father
    func find(key: Int) -> Int {
        // key existed in the father
        // we add one into
        guard var parent = dict[key] else {
            dict[key] = key
            return key
        }
            
        while dict[parent] != nil {
            // if fatherOfparent point to other
            if let fatherOfParent = dict[parent],
                parent != fatherOfParent {
                parent = fatherOfParent
            // if fatherOfparent point to itself
            // we find the top father
            } else {
                break
            }
        }
        return parent
    }
    
    /// connect left and right
    ///
    /// - Parameters:
    ///   - left: left key
    ///   - right: right key
    func union(left: Int, right: Int) {
        let leftFather = self.find(key: left)
        let rightFather = self.find(key: right)
        
        // if top father is not equal
        // we let rightFather as the new top father of left/right
        if leftFather != rightFather {
            dict[leftFather] = rightFather
        }
    }
}


/// UnionFind - improved model, compressed path
/// o(1) avg find
/// o(1) avg union

class UnionFind2 {
    var dict = Dictionary<Int, Int>()
    /// search for top father
    ///
    /// - Parameter key: serach key
    /// - Returns: top father
    func find(key: Int) -> Int {
        // key existed in the father
        // we add one into
        guard var topFather = dict[key] else {
            dict[key] = key
            return key
        }
        // find top father
        while dict[topFather] != nil {
            // if fatherOfparent point to other
            if let fatherOfParent = dict[topFather],
                topFather != fatherOfParent {
                topFather = fatherOfParent
                // if fatherOfparent point to itself
                // we find the top father
            } else {
                break
            }
        }
        // compress path
        // refind all path of key's father
        // change all dict[path] = topFather
        var father = key
        while dict[father] != nil {
            if let fatherOfFather = dict[father],
                father != fatherOfFather {
                dict[father] = topFather
                father = fatherOfFather
            } else {
                break
            }
        }
        return topFather
    }
    
    
    /// connect left and right
    ///
    /// - Parameters:
    ///   - left: left key
    ///   - right: right key
    func union(left: Int, right: Int) {
        let leftFather = self.find(key: left)
        let rightFather = self.find(key: right)
        
        // if top father is not equal
        // we let rightFather as the new top father of left/right
        if leftFather != rightFather {
            dict[leftFather] = rightFather
        }
    }
}

















/* Email problem - combine related entry

 input:
 name: "c1", emails: ["e1", "e2"]
 name: "c2", emails: ["e3", "e4"]
 name: "c3", emails: ["e5", "e6"]
 name: "c4", emails: ["e1", "e3"]

 return: [c1, c2, c4], [c3]

*/
struct EmailEntry {
    var name: String
    var emails: Array<String>
    init(name: String, emails: Array<String>) {
        self.name = name
        self.emails = emails
    }
    init() {
        self.name = ""
        self.emails = Array<String>()
    }
    
    
}
class UnionFind {
    // child email, parent email
    var dict = Dictionary<String, String>()
    // email, [userName]
    var emailBooks = Dictionary<String, Set<String>>()
    
    func add(entry: EmailEntry) -> Void {
        // combine with the same email
        combine(entry: entry)
        
        // find all related parents
        var fathers = Set<String>()
        for email in entry.emails {
            // if can find final father
            if let parent = dict[email] {
                let father = getFather(from: parent)
                fathers.insert(father)
            }
        }
        
        // if no fathers find / first entry
        if fathers.isEmpty {
            if let father = entry.emails.first {
                dict[father] = father
                for child in entry.emails {
                    if child != father {
                        dict[child] = father
                        add(user: entry.name, toFatherEmail: father)
                    }
                }
            }
        // all parents point to fahter
        } else {
            if let father = fathers.first {
                //print("final father: \(father)\n")
                for parent in fathers {
                    if parent != father {
                        dict[parent] = father
                        combine(from: parent, to: father)
                    }
                }
                for email in entry.emails {
                    dict[email] = father
                    add(user: entry.name, toFatherEmail: father)
                }
            }
        }
    }
    
    // print userList
    func userList() -> Array<Array<String>>? {
        if dict.isEmpty {
            return nil
        }
        var res = Array<Array<String>>()
        var usedEmailSet = Set<String>()
        for email in dict {
            // if cur email has parent
            if let parent = dict[email.key] {
                let father = getFather(from: parent)
                if usedEmailSet.contains(father) == false {
                    let userSet = emailBooks[father]!
                    res.append(Array(userSet))
                    usedEmailSet.insert(father)
                }
                
            } else {
            // if cur email has not parent
                if let userSet = emailBooks[email.key] {
                    res.append(Array(userSet))
                }
            }
        }
        return res
    }
    
    
    /// combine entry's email in to emailBooks
    ///
    /// - Parameter entry: input email entry
    private func combine(entry: EmailEntry) {
        // combine with the same email
        for email in entry.emails {
            if emailBooks[email] != nil {
                emailBooks[email]?.insert(entry.name)
            } else {
                emailBooks[email] = Set<String>([entry.name])
            }
        }
    }
    
    
    /// add userName to the father
    ///
    /// - Parameters:
    ///   - user: userName
    ///   - father: father
    private func add(user: String, toFatherEmail father: String) {
        if emailBooks[father] == nil {
            emailBooks[father] = Set<String>([user])
        } else {
            emailBooks[father]?.insert(user)
        }
    }
    
    
    /// combine userSet from child to father
    ///
    /// - Parameters:
    ///   - child: child name
    ///   - father: father name
    private func combine(from child: String, to father: String) {
        if let childSet = emailBooks[child] {
            emailBooks[father]?.formUnion(childSet)
        }
    }
    
    
    /// get final father
    ///
    /// - Parameter child: input child name
    /// - Returns: final father name
    private func getFather(from child: String) -> String {
        var father = child
        while (dict[father] != nil && dict[father] != father) {
            father = dict[father]!
        }
        return father
    }
}






// test
let emailUnion = UnionFind()

var entrys = Array<EmailEntry>()
entrys.append(EmailEntry(name: "c1", emails: ["e1", "e2"]))
entrys.append(EmailEntry(name: "c2", emails: ["e3", "e4"]))
entrys.append(EmailEntry(name: "c3", emails: ["e5", "e6"]))
entrys.append(EmailEntry(name: "c4", emails: ["e1", "e3"]))

for entry in entrys {
    emailUnion.add(entry: entry)
}

print("input: \n\(entrys)\n")
print("dict: \n\(emailUnion.dict)\n")
print("emailBooks: \n\(emailUnion.emailBooks)\n")


if let res = emailUnion.userList() {
    print("res: \(res)")
} else {
    print("nil")
}











