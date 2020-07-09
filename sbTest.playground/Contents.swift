import UIKit

var str = "Hello, playground"
func doIt() {
    print("一个全局函数")
    print(str)
}
struct Function {
    let name = "一个嵌套函数"
    func doIt1() {
        let age = 18
        print(name,age)
    }
}
doIt()
print("一个全局函数是一个不会捕获任何值的闭包")
let f = Function()

f.doIt1()
print("一个嵌套函数是一个捕获了其封闭函数域内值的闭包")


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward(_:_:))
reversedNames = names.sorted(by: { (s1, s2) -> Bool in
    return s1 > s2
})

//in: 完成对参数名字和闭包返回值的定义
func makeIncrementer(forIncrement amount: Int)->()->Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
//外层函数需要一个值返回一个闭包
//这个闭包捕获了外层函数作用域内的变量runningTotal，对total进行操作后讲runningTotal返回
//此时在外面可以调用incrementer
var myFunc = makeIncrementer(forIncrement: 4)
myFunc()
myFunc()
