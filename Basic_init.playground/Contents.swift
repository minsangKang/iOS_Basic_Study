import Foundation

class Person {
    var name: String
    var age: Int
    
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Man: Person {
    var isHandsome: Bool
    
    required init(name: String, age: Int) {
        self.isHandsome = true
        super.init(name: name, age: age)
    }
    
    convenience init(name: String, born: Int) {
        self.init(name: name, age: 2023-born)
    }
}
