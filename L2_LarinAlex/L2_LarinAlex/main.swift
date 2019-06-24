//
//  main.swift
//  L2_LarinAlex
//
//  Created by пользователь on 21/06/2019.
//  Copyright © 2019 Alex Larin. All rights reserved.
//

import Foundation


 
// функция определяющая четное или не четное число
func evenOrUneven(_ n:Int) -> Int {
    if n%2>0 {
        print("\(n) - нечетное число")
    }else{
        print("\(n) - четное число")    }
    return n
}
var a = evenOrUneven(4)


// функция определяющая делится ли число без остатка на 3
func divisionOn3(_ n:Int) -> Int {
    if n%3>0 {
        print("\(n) - не делится на 3")
    }else{
        print("\(n) - делится на 3")    }
    return n
}
var b = divisionOn3(4)


// возрастающий массив из 100 чисел
var myArray: [Int] = []
for i in (1...100) {
    myArray.append(i)
}
print(myArray)


// удаление из массива всех четных чисел и чисел которые не делятся на 3
myArray = myArray.filter({$0 % 3 != 0})
myArray = myArray.filter({$0 % 2 != 0})
print(myArray)


// функция добавляющая в массив [1,2,3] новое число Фибоначчи, добавление 90 элементов

func fibonachi( _ array:[Int], _ elements:Int = 0) -> [Int] {
    var newArray:[Int] = []
  for i in 0...elements {
    if i<=1{
        newArray.append(i)
    }
    else{
    let n = (newArray[i-1] + newArray[i-2])
    newArray.append(n)
    }
  }
    newArray = array + newArray
    return newArray
}
var array:[Int] = [1,2,3]
var secondArray = fibonachi (array, 90)
print(secondArray)


// преобразование возрастающего массива от 2 до 101 элементов в массив заполненный простыми числами
var simpleArray: [Int] = []
let n = 101
var p = 2
for i in 2...n{
    simpleArray.append(i)
}
print(simpleArray)
for p in 2...n where p*p<=n{
    for value in simpleArray{
        for k in 2...n where value==p*k{
            simpleArray.remove(at: simpleArray.firstIndex(of: value)!)
        }
        }
}
print(simpleArray)



