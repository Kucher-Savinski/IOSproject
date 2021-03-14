/*multiplying and plusing elements of array*/

import Foundation
class Array
 {
    var length:Int
    var resultSum = 0
    var resultMult = 1
    init()
    {
        length = 0
    }
    var array = [Int]()
    func sumOrMultiplicationElement(op1:Int, op2:Int, operation:(Int, Int)-> Int)-> Int
    {
        return operation(op1, op2)
    }
    func sumOrMultiplicationElementsArray(sign: String)-> Int
    {
        if sign=="+"
        {
            for i in 0..<length
            {
                resultSum=sumOrMultiplicationElement(op1:resultSum, op2:array[i], operation:+)
            }
            return resultSum
        }
        else
        {
            for i in 0..<length
            {
                resultMult=sumOrMultiplicationElement(op1:resultMult, op2:array[i], operation:*)
            }
            return resultMult
        }
    }
}
var arr = Array()
for i in 1...10 {
    arr.array.append(i)
    arr.length = i
}
print("Результат додавання елементів масиву: \(arr.sumOrMultiplicationElementsArray(sign: "+"))")
print("Результат множення елементів масиву: \(arr.sumOrMultiplicationElementsArray(sign: "*"))")