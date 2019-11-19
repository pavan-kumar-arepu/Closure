import UIKit

var str = "iOSSprinter-Closures"

//Knowledge: Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

/*
 Closures take one of three forms:
1. Global functions are closures that have a name and do not capture any values.
2. Nested functions are closures that have a name and can capture values from their enclosing function.
3. Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.
*/
let names = ["APK","Chinni","Paandu","Pandu","Ammu"]

var sortedName = names.sorted()

print("SortedNames are \(sortedName)")

func reverseOfSortedNameArray(s1: String, s2: String) -> Bool
{
    return s1 > s2
}

var reverseArrayNames = names.sorted(by: reverseOfSortedNameArray)

print("ReverseOf Names Array:\(reverseArrayNames)")


//Closure in 'expression' Syntax

var reverse_closureExpression = names.sorted(by: {(s1 : String, s2: String) -> Bool
    in
    return s1 > s2
})

print("Reverse Closure Expression: \(reverse_closureExpression)")


//Reverse of a string using 'Shorthand Arguments"

var reverse_shortHandForm = names.sorted(by: {$0 > $1})

print("Reverse_shortHandForm: \(reverse_shortHandForm)")

//Smallest Closure ever with an 'Operator' methods

var reverseOfArray_Operator = names.sorted(by:  > )

print("ReveseofAnArray with Operator :", reverseOfArray_Operator)


var reverseOfReverseOfAnArray_Operator = names.sorted(by:  < )

print("reverseOfReverseOfAnArray_Operator with Operator :", reverseOfReverseOfAnArray_Operator)


let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 03, 2017]

let strings = numbers.map { (number) -> String in
    var number = number
    print("Number:\(number)")
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        print("output: \(output)")
        number /= 10
    } while number > 0
    return output
}
print("Maping String : \(strings)")


//Capturing Values
/*
 A closure can capture constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables from within its body, even if the original scope that defined the constants and variables no longer exists.
 
 In Swift, the simplest form of a closure that can capture values is a nested function, written within the body of another function. A nested function can capture any of its outer function’s arguments and can also capture any constants and variables defined within the outer function.
 
 */

func makeIncrementer(forIncrement amount: Int) -> () -> Int
{
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementBy100 = makeIncrementer(forIncrement: 100)

incrementBy100()

incrementBy100()

incrementBy100()



//An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print("Now serving, customersInLine\(customersInLine)!")


let customerProvider = { customersInLine.remove(at: 1) }


print("Now serving , customerProvider \(customerProvider())!")


